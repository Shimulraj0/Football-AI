import 'package:get/get.dart';
import '../controllers/digital_product_hub_controller.dart';
import '../../home/controllers/home_controller.dart';

class DigitalProductHubBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DigitalProductHubController>(
      () => DigitalProductHubController(),
    );
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
