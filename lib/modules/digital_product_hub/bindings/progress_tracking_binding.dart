import 'package:get/get.dart';
import '../controllers/progress_tracking_controller.dart';

class ProgressTrackingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgressTrackingController>(() => ProgressTrackingController());
  }
}
