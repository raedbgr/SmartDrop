import '/imports.dart';

class MyNavBar extends StatelessWidget {
  final NavigationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => NavigationBar(
        height: 60,
        elevation: 1,
        overlayColor: WidgetStateColor.transparent,shadowColor: const Color(0xfffdfefe),
        backgroundColor: const Color(0xFF242529),
        indicatorColor: Colors.transparent,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex:
            controller.getSelectedIndex(controller.selectedPage.value),
        onDestinationSelected: (index) {
          final page = controller.getPageFromIndex(index);
          if (page != null) {
            controller.navigateToPage(page);
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.bar_chart_rounded,
              size: 30,
              color: Color(0xffb3c3c0),
            ),
            selectedIcon: Icon(
              Icons.bar_chart_rounded,
              size: 30,
              color: Colors.blue,
            ),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.grass_rounded,
              size: 30,
              color: Color(0xffb3c3c0),
            ),
            selectedIcon: Icon(
              Icons.grass_rounded,
              size: 30,
              color: Colors.blue,
            ),
            label: 'Plants',
          ),
        ],
      ),
    );
  }
}
