import '/imports.dart';

class THChartController extends GetxController {
  RxList<int> temperatureData = <int>[].obs;
  RxList<int> humidityData = <int>[].obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startUpdatingData();
  }

  void startUpdatingData() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (temperatureData.length >= 30) {
        temperatureData.removeAt(0); // Keep last 30 seconds of data
        humidityData.removeAt(0);
      }

      temperatureData.add(dashCtrl.temperature.value.toInt());
      humidityData.add(dashCtrl.humidity.value.toInt());

      update(); // Update UI
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
