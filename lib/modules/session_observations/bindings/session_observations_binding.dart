import 'package:get/get.dart';
import '../controllers/session_observations_controller.dart';

class SessionObservationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SessionObservationsController>(
      () => SessionObservationsController(),
    );
  }
}
