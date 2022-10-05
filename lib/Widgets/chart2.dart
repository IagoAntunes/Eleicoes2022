import 'package:appeleicoes/Models/candidatos.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'indicator.dart';

class PieChartSample1 extends StatefulWidget {
  final List<Candidato>? listaCand;
  const PieChartSample1({Key? key, this.listaCand}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChartSample1State();
}

class PieChartSample1State extends State<PieChartSample1> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                      pieTouchData: PieTouchData(touchCallback:
                          (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      }),
                      startDegreeOffset: 180,
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 1,
                      centerSpaceRadius: 0,
                      sections: showingSections()),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (var pessoa in widget.listaCand!)
                  Indicator(
                    color: pessoa.color!,
                    text: pessoa.nm!,
                    isSquare: false,
                    size: touchedIndex == int.parse(pessoa.seq!) - 1 ? 18 : 16,
                    textColor: touchedIndex == int.parse(pessoa.seq!) - 1
                        ? Colors.black
                        : Colors.grey,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      widget.listaCand!.length,
      (i) {
        final isTouched = i == touchedIndex;

        return PieChartSectionData(
          color: widget.listaCand![i].color!,
          value: double.parse(widget.listaCand![i].pvap!.replaceAll(',', '.')),
          title: widget.listaCand![i].pvap,
          radius: 80,
          titleStyle: TextStyle(
              fontSize: double.parse(
                          widget.listaCand![i].pvap!.replaceAll(',', '.')) <
                      10
                  ? 12
                  : 18,
              fontWeight: FontWeight.bold,
              color: Colors.black),
          titlePositionPercentageOffset: 0.55,
          borderSide: isTouched
              ? BorderSide(color: Colors.black, width: 3)
              : BorderSide(color: Colors.grey.withOpacity(0)),
        );
      },
    );
  }
}
