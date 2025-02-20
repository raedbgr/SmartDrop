import '/imports.dart';

class MyCard extends StatelessWidget {
  final Widget child;

  const MyCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF35373b),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: child,
      ),
    );
  }
}
