import 'package:get/get.dart';
import '../controllers/ai_communication_controller.dart';
import '../../home/controllers/home_controller.dart';

class AiCommunicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AiCommunicationController>(() => AiCommunicationController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
