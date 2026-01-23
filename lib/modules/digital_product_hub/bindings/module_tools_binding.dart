import 'package:get/get.dart';
import '../controllers/module_tools_controller.dart';

class ModuleToolsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModuleToolsController>(() => ModuleToolsController());
  }
}
