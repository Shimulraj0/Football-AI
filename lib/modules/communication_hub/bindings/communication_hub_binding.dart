import 'package:get/get.dart';
import '../controllers/communication_hub_controller.dart';

class CommunicationHubBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommunicationHubController>(() => CommunicationHubController());
  }
}
