import 'imports.dart';

class Routes {
  static final routes = [
    GetPage(name: '/login', page: () => LoginPage()),
    GetPage(name: '/register', page: () => RegisterPage()),
    GetPage(name: '/', page: () => NavigationPage()),
    GetPage(name: '/dashboard', page: () => DashboardPage(scaffoldKey: Get.arguments,), transition: Transition.leftToRight),
    GetPage(name: '/plants', page: () => PlantsPage(scaffoldKey: Get.arguments,), transition: Transition.rightToLeft),
  ];
}
