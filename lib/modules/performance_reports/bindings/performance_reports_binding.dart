import 'package:get/get.dart';
import '../controllers/performance_reports_controller.dart';

class PerformanceReportsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PerformanceReportsController>(
      () => PerformanceReportsController(),
    );
  }
}
