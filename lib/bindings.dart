import 'imports.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    // Created at start
    Get.put(AuthController());
    Get.put(NavigationController());
    Get.put(DashboardController());
    Get.put(THChartController());
    Get.put(WaterConsumptionController());
    Get.put(PlantsController());
  }
}
