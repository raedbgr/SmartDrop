import '/imports.dart';

class DashboardController extends GetxController {
  final double temperature = 37.0;
  final double humidity = 65.0;
  final int soilMoisture = 45;
  final int waterFlow = 30;
  final int waterLevel = 50;
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