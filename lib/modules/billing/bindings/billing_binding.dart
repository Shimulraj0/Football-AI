import 'package:get/get.dart';
import '../controllers/billing_controller.dart';
import '../controllers/parent_player_portal_controller.dart';

class BillingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BillingController>(() => BillingController());
    Get.lazyPut<ParentPlayerPortalController>(
      () => ParentPlayerPortalController(),
    );
  }
}
