import '/imports.dart';

class NavigationPage extends StatefulWidget {
  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final NavigationController controller = Get.find();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Scaffold(
        key: _scaffoldKey,
            backgroundColor: const Color(0xFF242529),
        body: controller.getScreen(controller.selectedPage.value, _scaffoldKey),
        bottomNavigationBar: MyNavBar(),
      ),
    );
  }
}
