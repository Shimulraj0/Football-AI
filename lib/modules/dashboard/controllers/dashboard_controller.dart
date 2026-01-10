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
    RoleModel(
      title: "Age Group\nCoordinator\n(AGC)",
      assetPath: 'assets/icons/ic_single_role.png',
    ),
    RoleModel(
      title: "Specialty Director",
      assetPath: 'assets/icons/ic_single_role.png',
    ),
    RoleModel(
      title: "Coach",
      assetPath: 'assets/icons/ic_group_role.png',
      // route: AppRoutes.home, // Removed to force Login
    ),
    RoleModel(title: "Player", assetPath: 'assets/icons/ic_single_role.png'),
    RoleModel(title: "Parent", assetPath: 'assets/icons/ic_single_role.png'),
    RoleModel(
      title: "Field Scheduling\nDirector",
      assetPath: 'assets/icons/ic_single_role.png',
    ),
    RoleModel(
      title: "TD AI —\nSOFTWARE\nADD-ON BILLING",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.billing,
    ),
    RoleModel(
      title: "TRYOUTS\nMODULE",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.tryouts,
    ),
    RoleModel(
      title: "CLINICS &\nCAMPS MODULE",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.clinics,
    ),
    RoleModel(
      title: "EVALUATION\nSYSTEM",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.evaluation,
    ),
    RoleModel(
      title: "SURVEYS\nMODULE",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.surveys,
    ),
    RoleModel(
      title: "Digital Product\nHub",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.digitalProductHub,
    ),
    RoleModel(
      title: "AI\nCOMMUNICATION",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.aiCommunication,
    ),
    RoleModel(
      title: "PERMISSIONS &\nROLE\nASSIGNMENT",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.permissions,
    ),
  ];

  void selectRole(String roleTitle) {
    // Find the role model
    RoleModel? role = roles.firstWhereOrNull((r) => r.title == roleTitle);

    if (role == null) return;

    selectedRole.value = roleTitle;

    // We mostly go to login now, passing the intended route if present
    Get.toNamed(
      AppRoutes.login,
      arguments: {'role': roleTitle, 'redirect': role.route},
    );
  }
}
