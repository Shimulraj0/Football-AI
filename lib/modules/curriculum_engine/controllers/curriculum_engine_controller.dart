import 'package:get/get.dart';

class CurriculumEngineController extends GetxController {
  // Create Curriculum State
  final RxInt currentStep = 1.obs;

  // Step 1: Age Group
  final RxString selectedAgeGroup = ''.obs;
  final List<String> ageGroups = [
    "U6 ( Under 6 years old )",
    "U8 ( Under 8 years old )",
    "U10 ( Under 10 years old )",
    "U12 ( Under 12 years old )",
    "U14 ( Under 14 years old )",
    "U16 ( Under 16 years old )",
  ];

  // Step 2: Frequency + Pillars
  final RxInt trainingFrequencyWeeks = 2.obs;

  // Step 2: Focus Areas
  // Using a list of areas and checking if they are selected.
  // We can use a Map or a List of strings.
  final RxList<String> selectedFocusAreas = <String>[].obs;
  final List<String> focusAreas = [
    "Technical (ball control, passing)",
    "Tactical (positioning, decision-making)",
    "Physical (strength, endurance)",
    "Psychosocial (teamwork, leadership)",
  ];

  void setStep(int step) {
    currentStep.value = step;
  }

  void selectAgeGroup(String group) {
    selectedAgeGroup.value = group;
  }

  void incrementFrequency() {
    trainingFrequencyWeeks.value++;
  }

  void decrementFrequency() {
    if (trainingFrequencyWeeks.value > 1) {
      trainingFrequencyWeeks.value--;
    }
  }

  void toggleFocusArea(String area) {
    if (selectedFocusAreas.contains(area)) {
      selectedFocusAreas.remove(area);
    } else {
      selectedFocusAreas.add(area);
    }
  }
}
