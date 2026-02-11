import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class MyHeatMap extends StatelessWidget {
  final DateTime startDate;
  final Map<DateTime, int> dataset;

  const MyHeatMap({super.key, required this.startDate, required this.dataset});

  @override
  Widget build(BuildContext context) {
    return HeatMap(
      startDate: startDate,
      endDate: DateTime.now(),
      datasets: dataset,
      colorMode: ColorMode.color,
      defaultColor: Theme.of(context).colorScheme.secondary,
      textColor: Colors.white,
      showColorTip: false,
      showText: true,
      scrollable: true,
      size: 30,
      colorsets: {
        1: Colors.orange.shade200,
        2: Colors.orange.shade400,
        3: Colors.orange.shade600,
        4: Colors.orange.shade700,
        5: Colors.orange.shade800,
      },
    );
  }
}
