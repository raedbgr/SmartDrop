import '/imports.dart';

class NavigationPage extends StatefulWidget {
  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final NavigationController controller = Get.find();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final AuthController authCtrl = Get.find<AuthController>();

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
        appBar: AppBar(
          backgroundColor: const Color(0xFF242529),
          title: const Text(
            'Smart Drop',
            style: TextStyle(
              color: Color(0xFFfdfefe),
              fontSize: 26,
              fontWeight: FontWeight.w300,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  authCtrl.signOut();
                },
                icon: const Icon(Icons.exit_to_app_rounded, color: Color(0xfffdfefe))
            )
          ],
        ),
        body: SafeArea(child: controller.getScreen(controller.selectedPage.value, _scaffoldKey)),
        bottomNavigationBar: MyNavBar(),
      ),
    );
  }
}
