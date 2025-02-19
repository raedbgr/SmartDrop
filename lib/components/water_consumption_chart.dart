import '/imports.dart';

class WaterConsumptionChart extends StatelessWidget {
  final List<double> waterConsumption; // List of water consumption per day

  WaterConsumptionChart({required this.waterConsumption});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1, // Adjust aspect ratio as needed
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: BarChart(
          BarChartData(
            barGroups: List.generate(
              waterConsumption.length,
                  (index) =>
                  BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: waterConsumption[index],
                        color: const Color(0xff006fff),
                        width: 15,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  ),
            ),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 50,
                  interval: 10,
                  maxIncluded: false,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      '${value.toInt()}',
                      style: const TextStyle(color: Color(0xfffdfefe)),
                    );
                  },
                ),
              ),
              rightTitles: const AxisTitles(),
              topTitles: const AxisTitles(),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    List<String> days = [
                      "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"
                    ];
                    return Text(
                      days[value.toInt()],
                      style: const TextStyle(color: Color(0xfffdfefe)),
                    );
                  },
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            gridData: FlGridData(
              show: true,
              drawHorizontalLine: true,
              drawVerticalLine: false,
              horizontalInterval: 10, // Adjust for spacing between grid lines
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color(0xffb3c3c0).withOpacity(0.5),
                  strokeWidth: 1,
                  dashArray: [5],
                );
              },
            ),
            barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
                getTooltipColor: (_) => const Color(0xffdadada),
                tooltipRoundedRadius: 75,
                tooltipPadding: const EdgeInsets.all(8),
                tooltipMargin: 5,
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  return BarTooltipItem(
                    '${rod.toY} L',
                    const TextStyle(
                      color: Color(0xff080908),
                      fontWeight: FontWeight.w300,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
