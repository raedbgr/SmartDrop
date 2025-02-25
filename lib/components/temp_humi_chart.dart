import '/imports.dart';

class TempHumiChart extends StatelessWidget {

  TempHumiChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AspectRatio(
        aspectRatio: 1.8,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: LineChart(
            LineChartData(
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    getTitlesWidget: (value, meta) {
                      return Text('${value.toInt()}°C',
                          style: const TextStyle(fontSize: 12, color: Color(0xfffdfefe)));
                    },
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    getTitlesWidget: (value, meta) {
                      return Text('${value.toInt()}s',
                          style: const TextStyle(fontSize: 12, color: Color(0xfffdfefe)));
                    },
                  ),
                ),
                rightTitles: const AxisTitles(),
                topTitles: const AxisTitles(),
              ),
              gridData: const FlGridData(show: true),
              borderData: FlBorderData(
                show: true,
                border: Border(
                  left: BorderSide(color: const Color(0xffb3c3c0).withOpacity(0.5), width: 1),
                  bottom: BorderSide(color: const Color(0xffb3c3c0).withOpacity(0.5), width: 1),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: thChartCtrl.temperatureData
                      .asMap()
                      .entries
                      .map((e) => FlSpot(e.key.toDouble(), e.value.toDouble())) // Cast values to double
                      .toList(),
                  isCurved: true,
                  color: const Color(0xfff71735),
                  dotData: const FlDotData(show: false),
                ),
                LineChartBarData(
                  spots: thChartCtrl.humidityData
                      .asMap()
                      .entries
                      .map((e) => FlSpot(e.key.toDouble(), e.value.toDouble())) // Cast values to double
                      .toList(),
                  isCurved: true,
                  color: const Color(0xff006fff),
                  dotData: const FlDotData(show: false),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
