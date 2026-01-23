import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ManualBuilderController extends GetxController {
  final drillsController = TextEditingController();
  final videosController = TextEditingController();
  final playingStructureController = TextEditingController();

  @override
  void onClose() {
    drillsController.dispose();
    videosController.dispose();
    playingStructureController.dispose();
    super.onClose();
  }

  void onSaveAndContinue() {
    // Handle save logic
    Get.snackbar('Success', 'Manual Builder saved!');
    // Navigate to next step or go back
  }
}
