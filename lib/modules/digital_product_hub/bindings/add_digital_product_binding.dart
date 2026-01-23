import 'package:get/get.dart';
import '../controllers/add_digital_product_controller.dart';

class AddDigitalProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddDigitalProductController>(
      () => AddDigitalProductController(),
    );
  }
}
