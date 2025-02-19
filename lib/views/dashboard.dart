import '/imports.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard"), centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 40,
          children: [
            // Water Temperature & Humidity
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text("Water Temperature", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("28°C", style: TextStyle(fontSize: 24, color: Colors.blue)),
                    SizedBox(height: 10),
                    Text("Humidity", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("65%", style: TextStyle(fontSize: 24, color: Colors.green)),
                  ],
                ),
              ),
            ),

            // Water Consumption Graph
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Water Consumption (Ltr/day)", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    WaterConsumptionChart(waterConsumption: [15, 20, 12, 30, 25, 18, 22]),
                  ],
                ),
              ),
            ),

            // Rain Detector
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Rain Detector", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Icon(Icons.cloud, color: Colors.grey, size: 40), // Change based on status
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}