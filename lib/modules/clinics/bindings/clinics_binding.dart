import 'package:get/get.dart';
import '../controllers/clinics_controller.dart';

class ClinicsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClinicsController>(() => ClinicsController());
  }
}
