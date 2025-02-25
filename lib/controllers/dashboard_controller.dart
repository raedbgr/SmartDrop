import '/imports.dart';

class DashboardController extends GetxController {
// Variables to store sensor data
  var temperature = 0.0.obs;
  var humidity = 0.0.obs;
  var soilMoisture = 0.obs;
  var waterLevel = 0.obs;
  var flowRate = 0.0.obs;
  var totalLiters = 0.0.obs;
  var irrigationStatus = false.obs;
  var alarmStatus = false.obs;

  // Reference to Firebase Realtime Database
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref();

  @override
  void onInit() {
    super.onInit();
  }

  // Function to fetch data from Firebase
  void fetchData() {
    print("Fetched data: init "); // Debug

    _databaseRef.child('sensor_data').onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        print("Fetched data: $data"); // Debugging

        temperature.value = (data['temperature'] as num?)?.toDouble() ?? 0.0;
        humidity.value = (data['humidity'] as num?)?.toDouble() ?? 0.0;
        soilMoisture.value = data['soil_moisture'] ?? 0; // Already int
        waterLevel.value = data['water_level'] ?? 0; // Already int
        flowRate.value = (data['flow_rate'] as num?)?.toDouble() ?? 0.0;
        totalLiters.value = (data['total_liters'] as num?)?.toDouble() ?? 0.0;
        irrigationStatus.value = data['irrigation_status'] ?? false;
        alarmStatus.value = data['alarm_status'] ?? false;

        print("Soil Moisture: ${soilMoisture.value}"); // Debugging
        print("Water Level: ${waterLevel.value}"); // Debugging
      } else {
        print("No data found in Firebase!");
      }
    });
  }
}
