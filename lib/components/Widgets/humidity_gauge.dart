import '/imports.dart';

class HumidityGauge extends StatelessWidget {
  final double humidity;
  HumidityGauge({Key? key, required this.humidity}) : super(key: key);
  Color color = const Color(0xff8075ff);

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
              color: color,
              width: 3,
            ),
            shape: BoxShape.circle,
            color: const Color(0xFF35373b),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Center(
            child: Text(
              '${humidity.toInt()}%',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w300, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
