import 'package:get/get.dart';
import '../controllers/select_available_fields_controller.dart';
import '../../../home/controllers/home_controller.dart';

class SelectAvailableFieldsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectAvailableFieldsController>(
      () => SelectAvailableFieldsController(),
    );
    // Ensure HomeController is available for the bottom nav bar
    if (!Get.isRegistered<HomeController>()) {
      Get.lazyPut<HomeController>(() => HomeController());
    }
  }
}
