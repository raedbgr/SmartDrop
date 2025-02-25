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

    // Created when needed
    Get.lazyPut<PlantsController>(() => PlantsController());
  }
}

DashboardController get dashCtrl => Get.find<DashboardController>();
THChartController get thChartCtrl => Get.find<THChartController>();
WaterConsumptionController get waterCnsmCtrl => Get.find<WaterConsumptionController>();