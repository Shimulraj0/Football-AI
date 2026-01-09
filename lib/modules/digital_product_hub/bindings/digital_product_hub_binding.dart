import 'package:get/get.dart';
import '../controllers/digital_product_hub_controller.dart';

class DigitalProductHubBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DigitalProductHubController>(
      () => DigitalProductHubController(),
    );
  }
}
