import 'package:get/get.dart';
import '../controllers/module_cover_controller.dart';

class ModuleCoverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModuleCoverController>(() => ModuleCoverController());
  }
}
