import '/imports.dart';

class WaterConsumptionChart extends StatelessWidget {
  final List<double> waterConsumption; // List of water consumption per day

  WaterConsumptionChart({required this.waterConsumption});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7, // Adjust aspect ratio as needed
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 50, // Adjust according to max consumption
            barGroups: _generateBarGroups(),
            titlesData: FlTitlesData(
              leftTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: true, reservedSize: 40),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: _bottomTitles,
                  reservedSize: 32,
                ),
              ),
            ),
            gridData: const FlGridData(show: true),
            borderData: FlBorderData(show: false),
          ),
        ),
      ),
    );
  }

  // Generate bar groups from the list of water consumption data
  List<BarChartGroupData> _generateBarGroups() {
    return List.generate(waterConsumption.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: waterConsumption[index], // Water consumption value
            color: Colors.blue, // Bar color
            width: 16,
            borderRadius: BorderRadius.circular(6),
          ),
        ],
      );
    });
  }

  // Custom bottom labels for each day
  Widget _bottomTitles(double value, TitleMeta meta) {
    List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        days[value.toInt() % days.length], // Cycle through days
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }
}
