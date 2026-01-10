import 'package:get/get.dart';
import '../controllers/training_feedback_controller.dart';

class TrainingFeedbackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrainingFeedbackController>(() => TrainingFeedbackController());
  }
}
