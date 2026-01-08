import 'package:get/get.dart';

class SettingsController extends GetxController {
  final isPushNotificationsEnabled = true.obs;

  void togglePushNotifications(bool value) {
    isPushNotificationsEnabled.value = value;
  }

  void logout() {
    // Implement logout logic here
    Get.offAllNamed('/login');
  }
}
