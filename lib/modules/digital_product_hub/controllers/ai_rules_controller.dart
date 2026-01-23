import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiRulesController extends GetxController {
  final toneEnabled = true.obs;
  final selectedTone = 'Encouraging'.obs;

  final restrictionsEnabled = true.obs;
  final restrictedTopics = <String>[].obs;

  final promptMasteryEnabled = false.obs; // Defaults to off as per typical UI
  final promptController = TextEditingController();

  final availableTones = ['Encouraging', 'Technical', 'Strict'];
  final availableRestrictions = ['Injury', 'Risks', 'Controversial tactics'];

  @override
  void onInit() {
    super.onInit();
    // Initialize defaults if needed
    restrictedTopics.addAll(['Injury']); // Example default
  }

  void toggleToneEnabled(bool value) => toneEnabled.value = value;

  void selectTone(String tone) {
    selectedTone.value = tone;
  }

  void toggleRestrictionsEnabled(bool value) =>
      restrictionsEnabled.value = value;

  void toggleRestriction(String topic) {
    if (restrictedTopics.contains(topic)) {
      restrictedTopics.remove(topic);
    } else {
      restrictedTopics.add(topic);
    }
  }

  void togglePromptMasteryEnabled(bool value) =>
      promptMasteryEnabled.value = value;

  void resetToDefault() {
    toneEnabled.value = true;
    selectedTone.value = 'Encouraging';
    restrictionsEnabled.value = true;
    restrictedTopics.assignAll(['Injury']);
    promptMasteryEnabled.value = false;
    promptController.clear();
    Get.snackbar(
      'Reset',
      'Rules reset to default',
      backgroundColor: Colors.orange,
      colorText: Colors.white,
    );
  }

  void updateRules() {
    Get.snackbar(
      'Success',
      'AI Rules updated successfully',
      backgroundColor: const Color(0xFF30C360),
      colorText: Colors.white,
    );
  }

  @override
  void onClose() {
    promptController.dispose();
    super.onClose();
  }
}
