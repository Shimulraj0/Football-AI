import 'package:get/get.dart';
import '../controllers/tryouts_controller.dart';

class TryoutsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TryoutsController>(() => TryoutsController());
  }
}
