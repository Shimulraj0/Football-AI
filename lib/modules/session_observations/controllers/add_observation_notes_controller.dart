import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddObservationNotesController extends GetxController {
  final observationNotesController = TextEditingController();

  // Focus Areas
  final focusAreas = <String>[
    'Technique',
    'Tactical Awareness',
    'Physical',
    'Confidence',
  ];

  final selectedFocusAreas = <String>[].obs;

  // Lists for Strengths and Improvements
  final strengths = <String>[].obs;
  final areasToImprove = <String>[].obs;

  @override
  void onClose() {
    observationNotesController.dispose();
    super.onClose();
  }

  void toggleFocusArea(String area) {
    if (selectedFocusAreas.contains(area)) {
      selectedFocusAreas.remove(area);
    } else {
      selectedFocusAreas.add(area);
    }
  }

  void addStrength(String strength) {
    if (strength.isNotEmpty) {
      strengths.add(strength);
    }
  }

  void removeStrength(int index) {
    strengths.removeAt(index);
  }

  void addAreaToImprove(String area) {
    if (area.isNotEmpty) {
      areasToImprove.add(area);
    }
  }

  void removeAreaToImprove(int index) {
    areasToImprove.removeAt(index);
  }

  void saveObservation() {
    // Implement save logic here (e.g., API call)
    print('Saving Observation:');
    print('Focus Areas: $selectedFocusAreas');
    print('Notes: ${observationNotesController.text}');
    print('Strengths: $strengths');
    print('Areas to Improve: $areasToImprove');
    Get.back();
    Get.snackbar(
      'Success',
      'Observation saved successfully',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
