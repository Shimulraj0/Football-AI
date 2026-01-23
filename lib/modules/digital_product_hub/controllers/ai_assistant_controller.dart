import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiAssistantController extends GetxController {
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

  void onDraftItemClicked() {
    // TODO: Implement draft item logic
  }

  void onGeneratePdfClicked() {
    // TODO: Implement generate PDF logic
  }
}
