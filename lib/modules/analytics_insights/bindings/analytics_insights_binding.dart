import 'package:get/get.dart';
import '../controllers/analytics_insights_controller.dart';

class AnalyticsInsightsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnalyticsInsightsController>(
      () => AnalyticsInsightsController(),
    );
  }
}
