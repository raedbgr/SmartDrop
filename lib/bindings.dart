import 'imports.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    // Created at start
    Get.put(AuthController());
    Get.put(NavigationController());

    // Created when needed
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<PlantsController>(() => PlantsController());
  }
}