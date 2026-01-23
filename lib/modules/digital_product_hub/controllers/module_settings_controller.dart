import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModuleSettingsController extends GetxController {
  final u12ScanningChecklist = true.obs;
  final allowDownloads = true.obs;
  final shareRoleAccess = true.obs;
  final enablePurchase = false.obs;

  final priceController = TextEditingController();

  void toggleU12ScanningChecklist(bool value) =>
      u12ScanningChecklist.value = value;
  void toggleAllowDownloads(bool value) => allowDownloads.value = value;
  void toggleShareRoleAccess(bool value) => shareRoleAccess.value = value;
  void toggleEnablePurchase(bool value) => enablePurchase.value = value;

  void saveChanges() {
    Get.snackbar(
      'Success',
      'Settings saved successfully',
      backgroundColor: const Color(0xFF30C360),
      colorText: Colors.white,
    );
  }

  void deleteModule() {
    Get.snackbar(
      'Delete',
      'Delete module tapped',
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  @override
  void onClose() {
    priceController.dispose();
    super.onClose();
  }
}
