import 'imports.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
  }
}