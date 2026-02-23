import 'package:get/get.dart';
import '../controllers/periodization_integration_controller.dart';

class PeriodizationIntegrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PeriodizationIntegrationController>(
      () => PeriodizationIntegrationController(),
    );
  }
}
