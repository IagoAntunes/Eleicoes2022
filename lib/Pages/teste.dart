import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChartsTest extends StatelessWidget {
  const ChartsTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
        children: [PieChart(PieChartData(sections: data))],
      )),
    );
  }
}

List<PieChartSectionData> data = [
  PieChartSectionData(title: 'A', color: Colors.red),
  PieChartSectionData(title: 'A', color: Colors.red),
  PieChartSectionData(title: 'A', color: Colors.red),
];
