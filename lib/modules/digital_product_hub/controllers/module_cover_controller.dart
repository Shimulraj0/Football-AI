import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ModuleCoverController extends GetxController {
  final subtitleController = TextEditingController();
  final descriptionController = TextEditingController();
  final createdByController = TextEditingController();

  // Mock initial data
  @override
  void onInit() {
    super.onInit();
    subtitleController.text =
        "Technical drills to improve first touch & Control";
    createdByController.text = "Created by: Coach Alex Taylor";
  }

  @override
  void onClose() {
    subtitleController.dispose();
    descriptionController.dispose();
    createdByController.dispose();
    super.onClose();
  }

  void onContinue() {
    Get.snackbar('Success', 'Module Cover saved!');
    // Navigate to next step
  }
}
