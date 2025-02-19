import '/imports.dart';

class NavigationController extends GetxController {
  final RxString selectedPage = '/home'.obs; // Initialize with default page

  Widget getScreen(String page, GlobalKey<ScaffoldState> scaffoldKey) {
    switch (page) {
      case '/home':
        return DashboardPage(scaffoldKey: scaffoldKey);
      case '/plants':
        return PlantsPage(scaffoldKey: scaffoldKey);
      default:
        return DashboardPage(scaffoldKey: scaffoldKey); // Default page
    }
  }

  void navigateToPage(String page) {
    selectedPage.value = page;
  }

  // Maps the string route to the index
  int getSelectedIndex(String page) {
    switch (page) {
      case '/dashboard':
        return 0;
      case '/plants':
        return 1;
      default:
        return 0; // Default to Home page
    }
  }

  // Maps the index to the string route
  String? getPageFromIndex(int index) {
    switch (index) {
      case 0:
        return '/dashboard';
      case 1:
        return '/plants';
      default:
        return null;
    }
  }
}
