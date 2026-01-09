import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../settings/controllers/settings_controller.dart';
import '../controllers/coach_ai_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SettingsController>(() => SettingsController());
    Get.lazyPut<CoachAiController>(() => CoachAiController());
  }
}
