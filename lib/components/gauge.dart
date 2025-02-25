import '/imports.dart';

class Gauge extends StatelessWidget {
  final bool isTemp;
  Gauge({super.key, required this.isTemp});
  Color color = const Color(0xff006fff);
  Color _getTemperatureColor(double temp) {
    if (temp < 15) {
      return Colors.blue;
    } else if (temp < 30) {
      return Colors.orange;
    } else {
      return const Color(0xfff71735);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx( () {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isTemp ? _getTemperatureColor(dashCtrl.temperature.value) : color,
                    width: 3,
                  ),
                  shape: BoxShape.circle,
                  color: const Color(0xFF35373b),
                  boxShadow: [
                    BoxShadow(
                      color: isTemp
                          ? _getTemperatureColor(dashCtrl.temperature.value).withOpacity(0.5)
                          : color.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Center(
                  child: isTemp
                      ? Text(
                          '${dashCtrl.temperature.value}°ᶜ',
                          style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        )
                      : Text(
                          '${dashCtrl.humidity.value}%',
                          style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                )),
          ],
        );
      }
    );
  }
}
