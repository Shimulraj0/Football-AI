import 'package:get/get.dart';
import '../controllers/team_management_controller.dart';

class TeamManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeamManagementController>(() => TeamManagementController());
  }
}
