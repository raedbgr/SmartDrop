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
      child: Expanded(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 5,
              children: [
                // Water Temperature & Humidity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // temperature gauge
                    Expanded(
                      child: MyCard(
                        child: Column(
                          spacing: 10,
                          children: [
                            Gauge(isTemp: true),
                            const Text("Temperature",
                                style: TextStyle(
                                    color: Color(0xfffdfefe),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300)),
                          ],
                        ),
                      ),
                    ),
                    // humidity gauge
                    Expanded(
                      child: MyCard(
                        child: Column(
                          spacing: 10,
                          children: [
                            Gauge(isTemp: false),
                            const Text("Humidity",
                                style: TextStyle(
                                    color: Color(0xfffdfefe),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Weather
                const MyCard(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.cloud, color: Color(0xff006fff), size: 40),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Weather",
                                  style: TextStyle(
                                      color: Color(0xfffdfefe),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300)),
                            ],
                          ),
                        ],
                      ),
                      Text("Cold",
                          style: TextStyle(
                              color: Color(0xff006fff),
                              fontSize: 20,
                              fontWeight: FontWeight.w300)),
                    ],
                  ),
                )),
                // Soil Moisture, Water Flow Rate, Water Level
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MyCard(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 20,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Soil',
                                  style: TextStyle(
                                      color: Color(0xfffdfefe),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300)),
                              Text('Moisture',
                                  style: TextStyle(
                                      color: Color(0xff768380),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300)),
                            ],
                          ),
                          Text('${dashCtrl.soilMoisture}%',
                              style: const TextStyle(
                                  color: Color(0xff006fff),
                                  fontSize: 36,
                                  fontWeight: FontWeight.w300)),
                        ],
                      )),
                    ),
                    Expanded(
                      child: MyCard(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 20,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Water',
                                  style: TextStyle(
                                      color: Color(0xfffdfefe),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300)),
                              Text('Flow Rate',
                                  style: TextStyle(
                                      color: Color(0xff768380),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300)),
                            ],
                          ),
                          Text('${dashCtrl.waterFlow}%',
                              style: const TextStyle(
                                  color: Color(0xff006fff),
                                  fontSize: 36,
                                  fontWeight: FontWeight.w300)),
                        ],
                      )),
                    ),
                    Expanded(
                      child: MyCard(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 20,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Water',
                                  style: TextStyle(
                                      color: Color(0xfffdfefe),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300)),
                              Text('Level',
                                  style: TextStyle(
                                      color: Color(0xff768380),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300)),
                            ],
                          ),
                          Text('${dashCtrl.waterLevel}%',
                              style: const TextStyle(
                                  color: Color(0xff006fff),
                                  fontSize: 36,
                                  fontWeight: FontWeight.w300)),
                        ],
                      )),
                    ),
                  ],
                ),
                // Water Consumption Chart
                MyCard(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 30,
                  children: [
                    const Text("Water Consumption",
                        style: TextStyle(
                            color: Color(0xfffdfefe),
                            fontSize: 18,
                            fontWeight: FontWeight.w300)),
                    SizedBox(
                      height: 200,
                      child: WaterConsumptionChart(
                          waterConsumption: dashCtrl.waterConsumption),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
