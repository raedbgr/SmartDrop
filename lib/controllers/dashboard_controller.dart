import '/imports.dart';

class DashboardController extends GetxController {
  final double temperature = 37.0;
  final double humidity = 65.0;
  final int soilMoisture = 45;
  final int waterFlow = 30;
  final int waterLevel = 50;
  final List<double> temperatureData = [
    19.0,
    30.0,
    8.0,
    37.0,
    28.0,
    11.0,
    17.0
  ];
  final List<double> humidityData = [30.0, 61.0, 40.0, 33.0, 28.0, 75.0, 55.0];
  final List<double> waterConsumption = [
    8.5,
    10.2,
    40.1,
    20.2,
    20.9,
    33.1,
    24.7
  ];
}
