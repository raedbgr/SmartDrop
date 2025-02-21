import '/imports.dart';

class TempHumiChart extends StatelessWidget {
  final List<double> temperatureData;
  final List<double> humidityData;

  const TempHumiChart({
    super.key,
    required this.temperatureData,
    required this.humidityData,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.8, // Adjust the size
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: LineChart(
          LineChartData(
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  maxIncluded: false,
                  minIncluded: false,
                  reservedSize: 40,
                  getTitlesWidget: (value, meta) {
                    return Text('${value.toInt()}°C',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xfffdfefe),
                        ));
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  getTitlesWidget: (value, meta) {
                    return Text('${value.toInt()}s',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xfffdfefe),
                        ));
                  },
                ),
              ),
              rightTitles: const AxisTitles(),
              topTitles: const AxisTitles(),
            ),
            gridData: FlGridData(
              show: true,
              drawHorizontalLine: true,
              drawVerticalLine: true,
              horizontalInterval: 20,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color(0xffb3c3c0).withOpacity(0.5),
                  strokeWidth: 1,
                  dashArray: [5],
                );
              },
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: const Color(0xffb3c3c0).withOpacity(0.5),
                  strokeWidth: 1,
                  dashArray: [5],
                );
              },
            ),
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                getTooltipColor: (_) => const Color(0xffdadada),
                tooltipRoundedRadius: 75,
                tooltipPadding: const EdgeInsets.all(8),
                tooltipMargin: 5,
                getTooltipItems: (List<LineBarSpot> touchedSpots) {
                  return touchedSpots.map((LineBarSpot touchedSpot) {
                    return LineTooltipItem(
                      '${touchedSpot.y.toInt()}',
                      const TextStyle(color: Color(0xff080908)),
                    );
                  }).toList();
                },
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border(
                left: BorderSide(
                  color: const Color(0xffb3c3c0).withOpacity(0.5),
                  width: 1,
                ),
                bottom: BorderSide(
                  color: const Color(0xffb3c3c0).withOpacity(0.5),
                  width: 1,
                ),
              ),
            ),
            lineBarsData: [
              // Temperature Line
              LineChartBarData(
                spots: temperatureData.asMap().entries.map((e) {
                  return FlSpot(e.key.toDouble(), e.value);
                }).toList(),
                isCurved: true,
                color: const Color(0xfff71735),
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
              // Humidity Line
              LineChartBarData(
                spots: humidityData.asMap().entries.map((e) {
                  return FlSpot(e.key.toDouble(), e.value);
                }).toList(),
                isCurved: true,
                color: const Color(0xff006fff),
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
