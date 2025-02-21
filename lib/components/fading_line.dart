import '/imports.dart';

class FadingLinesSeparator extends StatelessWidget {
  final String text;

  const FadingLinesSeparator({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xffb3c3c0).withOpacity(0),
                  const Color(0xffb3c3c0).withOpacity(0.5),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            style: const TextStyle(color: Color(0xffb3c3c0), fontSize: 16),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xffb3c3c0).withOpacity(0.5),
                  const Color(0xffb3c3c0).withOpacity(0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}