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
        color: Colors.white,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 28,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            const SizedBox(
              height: 18,
            ),
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
        final opacity = isTouched ? 1.0 : 0.6;

        const color0 = Color(0xff0293ee);
        const color1 = Color(0xfff8b250);
        const color2 = Color(0xff845bef);
        const color3 = Color(0xff13d38e);

        return PieChartSectionData(
          color: widget.listaCand![i].color!,
          value: 25,
          title: widget.listaCand![i].pvap,
          radius: 80,
          titleStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff044d7c)),
          titlePositionPercentageOffset: 0.55,
          borderSide: isTouched
              ? BorderSide(color: Colors.black, width: 3)
              : BorderSide(color: Colors.grey.withOpacity(0)),
        );
      },
    );
  }
}
