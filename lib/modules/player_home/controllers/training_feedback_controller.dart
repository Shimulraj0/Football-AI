import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainingFeedbackController extends GetxController {
  final passingController = TextEditingController();
  final notesController = TextEditingController();

  final RxDouble focusLevel = 5.0.obs;
  final RxDouble energyLevel = 5.0.obs;
  final RxDouble confidenceLevel = 5.0.obs;

  @override
  void onClose() {
    passingController.dispose();
    notesController.dispose();
    super.onClose();
  }
}
