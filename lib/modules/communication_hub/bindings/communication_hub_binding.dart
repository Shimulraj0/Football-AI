import 'package:get/get.dart';
import '../controllers/communication_hub_controller.dart';
import '../../home/controllers/home_controller.dart';

class CommunicationHubBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommunicationHubController>(() => CommunicationHubController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
