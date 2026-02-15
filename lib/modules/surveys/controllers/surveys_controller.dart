import 'package:get/get.dart';

class SurveysController extends GetxController {
  final RxMap<int, String> selectedOptions = <int, String>{}.obs;
  final RxInt remindersSent = 1.obs;

  void updateOption(int questionId, String option) {
    selectedOptions[questionId] = option;
  }

  void addQuestion() {
    Get.snackbar(
      "Module Info",
      "Dynamic question addition will be implemented in the next phase.",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void sendReminder() {
    remindersSent.value++;
    Get.snackbar(
      "Success",
      "Reminder sent successfully to all pending participants.",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
