import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class SettingsController extends GetxController {
  final isPushNotificationsEnabled = true.obs;

  void togglePushNotifications(bool value) {
    isPushNotificationsEnabled.value = value;
  }

  void logout() {
    // Implement logout logic here
    Get.offAllNamed(AppRoutes.dashboard);
  }
}
