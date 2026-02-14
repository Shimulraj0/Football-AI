import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class TryoutsController extends GetxController {
  void navigateToSetup() {
    Get.toNamed(AppRoutes.tryoutSetup);
  }

  void navigateToEvalEntry() {
    Get.toNamed(AppRoutes.tryoutEvalEntry);
  }

  void navigateToScoring() {
    Get.toNamed(AppRoutes.tryoutScoring);
  }

  void navigateToPlacement() {
    Get.toNamed(AppRoutes.tryoutPlacement);
  }

  void navigateToInvites() {
    Get.toNamed(AppRoutes.tryoutInvites);
  }
}
