import 'package:get/get.dart';
import '../controllers/manual_builder_controller.dart';

class ManualBuilderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManualBuilderController>(() => ManualBuilderController());
  }
}
