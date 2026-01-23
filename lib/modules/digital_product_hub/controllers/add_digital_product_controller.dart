import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddDigitalProductController extends GetxController {
  final coachController = TextEditingController(); // For dropdown or selection
  final descriptionController = TextEditingController();

  // Selected coach
  final RxString selectedCoach = ''.obs;

  // List of coaches (mock data)
  final List<String> coaches = ['Coach A', 'Coach B', 'Coach C'];

  @override
  void onClose() {
    coachController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  void onCoachSelected(String? value) {
    if (value != null) {
      selectedCoach.value = value;
    }
  }

  void onContinue() {
    // Handle continue action
    Get.snackbar('Success', 'Proceeding to content creation...');
    // Navigation would go here
  }
}
