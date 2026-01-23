import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModuleToolsController extends GetxController {
  final u12ScanningChecklist = true.obs;
  final fullPracticePlan = true.obs;
  final defensiveShapeDrill = true.obs;

  void toggleU12ScanningChecklist(bool value) =>
      u12ScanningChecklist.value = value;
  void toggleFullPracticePlan(bool value) => fullPracticePlan.value = value;
  void toggleDefensiveShapeDrill(bool value) =>
      defensiveShapeDrill.value = value;

  Future<void> onUploadNewFile() async {
    try {
      final result = await FilePicker.platform.pickFiles();
      if (result != null) {
        Get.snackbar(
          'Success',
          'Selected file: ${result.files.single.name}',
          backgroundColor: const Color(0xFF30C360),
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick file: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
