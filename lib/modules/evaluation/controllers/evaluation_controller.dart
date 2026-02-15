import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import '../../../core/services/storage_service.dart';
import '../models/evaluation_model.dart';

class EvaluationController extends GetxController {
  final StorageService _storage = Get.find<StorageService>();
  // Observables for the selected player's evaluation
  final RxString playerName = "".obs;
  final RxString imagePath = "".obs;
  final RxString ageGroup = "".obs;
  final RxString dueDate = "".obs;
  final RxString headCoach = "".obs;

  // Map to store skill ratings (e.g., 'Handeling': 5)
  final RxMap<String, int> skillRatings = <String, int>{
    "Handeling": 5,
    "Footwork": 0,
    "Positioning": 0,
  }.obs;

  final coachNotesController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Load arguments if available
    if (Get.arguments != null && Get.arguments is Map) {
      final args = Get.arguments as Map;
      playerName.value = args['name'] ?? "Landom M.";
      imagePath.value = args['image'] ?? "assets/images/landon_m.png";
      ageGroup.value = args['ageGroup'] ?? "U8";
      dueDate.value = args['dueDate'] ?? "May 8";
      headCoach.value = args['headCoach'] ?? "Emily Warner";
    }
  }

  void updateRating(String skill, int value) {
    skillRatings[skill] = value;
  }

  void saveEvaluation() {
    final evaluation = EvaluationModel(
      playerName: playerName.value,
      imageUrl: imagePath.value,
      ageGroup: ageGroup.value,
      dueDate: dueDate.value,
      headCoach: headCoach.value,
      skillRatings: Map<String, int>.from(skillRatings),
      coachNotes: coachNotesController.text,
    );

    // Persist evaluation to local storage
    final evaluationsJson = _storage.read('evaluations') ?? '[]';
    final List<dynamic> evaluationsList = jsonDecode(evaluationsJson);
    evaluationsList.add(evaluation.toJson());
    _storage.write('evaluations', jsonEncode(evaluationsList));

    debugPrint("Saving Evaluation: ${evaluation.toJson()}");
    Get.back();
    Get.snackbar(
      "Success",
      "Evaluation for ${playerName.value} saved successfully!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF55A97E),
      colorText: Colors.white,
    );
  }

  @override
  void onClose() {
    coachNotesController.dispose();
    super.onClose();
  }
}
