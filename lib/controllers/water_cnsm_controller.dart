import '/imports.dart';

class WaterConsumptionController extends GetxController {
  // Daily water consumption data
  RxList<int> dailyWaterConsumption = <int>[0, 0, 0, 0, 0, 0, 0].obs; // Example data (7 days)

  // Function to update the daily water consumption (in liters)
  void updateWaterConsumption(List<int> dailyData) {
    dailyWaterConsumption.value = dailyData;
  }
}
