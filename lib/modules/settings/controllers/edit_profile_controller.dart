import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  final Rx<File?> profileImage = Rx<File?>(null);
  final Rx<File?> coverImage = Rx<File?>(null);

  final TextEditingController fullNameController = TextEditingController()
    ..text = "Sarah Martinez"; // Default/Mock value

  Future<void> pickImage({bool isCover = false}) async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        if (isCover) {
          coverImage.value = File(image.path);
        } else {
          profileImage.value = File(image.path);
        }
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to pick image: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withValues(alpha: 0.1),
        colorText: Colors.red,
        margin: const EdgeInsets.all(10),
      );
    }
  }

  @override
  void onClose() {
    fullNameController.dispose();
    super.onClose();
  }
}
