import '../../../routes/app_routes.dart';
import '../models/role_model.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final RxString selectedRole = 'Coach'.obs;

  final List<RoleModel> roles = [
    RoleModel(
      title: "Technical\nDirector (TD)",
      assetPath: 'assets/icons/ic_group_role.png',
    ),
    RoleModel(
      title: "Director of\nCoaching (DOC)",
      assetPath: 'assets/icons/ic_single_role.png',
    ),
    RoleModel(title: "Coach", assetPath: 'assets/icons/ic_group_role.png'),
    RoleModel(
      title: "Specialty Director",
      assetPath: 'assets/icons/ic_single_role.png',
    ),
    RoleModel(title: "Parent", assetPath: 'assets/icons/ic_single_role.png'),
    RoleModel(title: "Player", assetPath: 'assets/icons/ic_single_role.png'),
  ];

  void selectRole(String role) {
    selectedRole.value = role;
    Get.toNamed(AppRoutes.login, arguments: role);
  }
}
