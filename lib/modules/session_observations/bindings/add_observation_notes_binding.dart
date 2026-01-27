import 'package:get/get.dart';
import '../controllers/add_observation_notes_controller.dart';

class AddObservationNotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddObservationNotesController>(
      () => AddObservationNotesController(),
    );
  }
}
