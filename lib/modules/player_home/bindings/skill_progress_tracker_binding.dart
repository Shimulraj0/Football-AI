import 'package:get/get.dart';
import '../controllers/skill_progress_tracker_controller.dart';

class SkillProgressTrackerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SkillProgressTrackerController>(
      () => SkillProgressTrackerController(),
    );
  }
}
