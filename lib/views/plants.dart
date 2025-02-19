import '/imports.dart';

class PlantsPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const PlantsPage({required this.scaffoldKey, super.key});

  @override
  State<PlantsPage> createState() => _PlantsPageState();
}

class _PlantsPageState extends State<PlantsPage> {

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12.5, 15, 12.5, 15),
            child: Row(
              children: [
                SizedBox(width: 15),
                Text(
                  'Plants',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    color: Color(0xfffdfefe),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: SingleChildScrollView()),
        ],
      ),
    );
  }
}