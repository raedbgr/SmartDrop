import '/imports.dart';

class TemperatureGauge extends StatelessWidget {
  final double temperature;

  const TemperatureGauge({Key? key, required this.temperature}) : super(key: key);

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(
              color: _getTemperatureColor(temperature),
              width: 3,
            ),
            shape: BoxShape.circle,
            color: const Color(0xFF35373b),
            boxShadow: [
              BoxShadow(
                color: _getTemperatureColor(temperature).withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Center(
            child: Text(
              '${temperature.toInt()}°ᶜ',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w300, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
