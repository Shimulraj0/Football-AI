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

  final drafts = <String>[].obs;

  void onDraftItemClicked() {
    drafts.add('Draft ${drafts.length + 1}');
    Get.snackbar(
      'Draft Saved',
      'Item has been saved to drafts successfully.',
      backgroundColor: const Color(0xFF30C360),
      colorText: Colors.white,
    );
  }

  void onGeneratePdfClicked() {
    Get.dialog(
      AlertDialog(
        title: const Text('Generate PDF'),
        content: const Text(
          'This would generate a PDF summary of the content.',
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              Get.back();
              Get.snackbar(
                'Success',
                'PDF generated and downloaded successfully.',
                backgroundColor: const Color(0xFF30C360),
                colorText: Colors.white,
              );
            },
            child: const Text('Generate'),
          ),
        ],
      ),
    );
  }
}
