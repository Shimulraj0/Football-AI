import 'package:get/get.dart';
import '../controllers/player_home_controller.dart';
import '../../settings/controllers/settings_controller.dart';
import '../../home/controllers/coach_ai_controller.dart';

class PlayerHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayerHomeController>(() => PlayerHomeController());
    Get.lazyPut<SettingsController>(() => SettingsController());
    Get.lazyPut<CoachAiController>(() => CoachAiController());
  }
}
