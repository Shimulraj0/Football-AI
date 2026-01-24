import 'package:get/get.dart';
import '../controllers/assigned_age_groups_controller.dart';
import '../../home/controllers/home_controller.dart';

class AssignedAgeGroupsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssignedAgeGroupsController>(
      () => AssignedAgeGroupsController(),
    );
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
