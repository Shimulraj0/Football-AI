import 'package:get/get.dart';
import '../controllers/ai_rules_controller.dart';

class AiRulesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AiRulesController>(() => AiRulesController());
  }
}
