import 'package:get/get.dart';
import '../controllers/module_settings_controller.dart';

class ModuleSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModuleSettingsController>(() => ModuleSettingsController());
  }
}
