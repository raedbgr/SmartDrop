import '/imports.dart';

class WaterConsumptionChart extends StatelessWidget {
  WaterConsumptionChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final waterConsumptionData = waterCnsmCtrl.dailyWaterConsumption;
      return AspectRatio(
        aspectRatio: 1.8,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BarChart(
            BarChartData(
              gridData: const FlGridData(show: true),
              borderData: FlBorderData(
                  show: true,
                border: Border(
                  left: BorderSide(color: const Color(0xffb3c3c0).withOpacity(0.5), width: 1),
                  bottom: BorderSide(color: const Color(0xffb3c3c0).withOpacity(0.5), width: 1),
                ),
              ),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    getTitlesWidget: (value, meta) {
                      // Display day names for x-axis
                      List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                      return Text(
                        days[value.toInt()],
                        style: const TextStyle(fontSize: 12, color: Color(0xfffdfefe)),
                      );
                    },
                  ),
                ),
                topTitles: const AxisTitles(),
                rightTitles: const AxisTitles(),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      // Display water consumption values for y-axis
                      return Text(
                        '${value.toInt()}L',
                        style: const TextStyle(fontSize: 12, color: Color(0xfffdfefe)),
                      );
                    },
                  ),
                ),
              ),
              barGroups: waterConsumptionData
                  .asMap()
                  .entries
                  .map((e) => BarChartGroupData(
                x: e.key,
                barRods: [
                  BarChartRodData(
                    toY: e.value.toDouble(), // Daily water consumption (liters)
                    color: const Color(0xff006fff),
                    width: 16,
                  ),
                ],
              ))
                  .toList(),
            ),
          ),
        ),
      );
    });
  }
}
