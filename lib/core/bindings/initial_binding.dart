import 'package:get/get.dart';
import '../../modules/home/controllers/home_controller.dart';
import '../../modules/settings/controllers/settings_controller.dart';
import '../../modules/home/controllers/coach_ai_controller.dart';
import '../../modules/billing/controllers/billing_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
    Get.lazyPut<SettingsController>(() => SettingsController(), fenix: true);
    Get.lazyPut<CoachAiController>(() => CoachAiController(), fenix: true);
    Get.lazyPut<BillingController>(() => BillingController(), fenix: true);
  }
}
