import '/imports.dart';

class DashboardPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const DashboardPage({required this.scaffoldKey, super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardController dashCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(12.5, 15, 12.5, 15),
              child: Row(
                children: [
                  SizedBox(width: 15),
                  Text(
                    'Dashboard',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      color: Color(0xfffdfefe),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 20,
                    children: [
                      // Water Temperature & Humidity
                      Card(
                        color: const Color(0xFF35373b),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // temperature gauge
                              Column(
                                spacing: 10,
                                children: [
                                  Gauge(isTemp: true),
                                  // TemperatureGauge(temperature: temperature),
                                  const Text("Temperature",
                                      style: TextStyle(
                                          color: Color(0xfffdfefe),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300)),
                                ],
                              ),
                              // humidity gauge
                              Column(
                                spacing: 10,
                                children: [
                                  Gauge(isTemp: false),
                                  // HumidityGauge(humidity: humidity),
                                  const Text("Humidity",
                                      style: TextStyle(
                                          color: Color(0xfffdfefe),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Water Consumption Graph
                      // Water Consumption Graph
                      Card(
                        color: const Color(0xFF35373b),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            spacing: 50,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                "Water Consumption",
                                style: TextStyle(
                                    color: Color(0xfffdfefe),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                  height: 200,
                                  child: WaterConsumptionChart(
                                      waterConsumption: dashCtrl.waterConsumption)),
                            ],
                          ),
                        ),
                      ),
                      // Rain Detector
                      Card(
                        color: const Color(0xFF35373b),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Rain Detector",
                                  style: TextStyle(
                                      color: Color(0xfffdfefe),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300)),
                              Icon(Icons.cloud,
                                  color: Color(0xff8075ff),
                                  size: 40), // Change based on status
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
