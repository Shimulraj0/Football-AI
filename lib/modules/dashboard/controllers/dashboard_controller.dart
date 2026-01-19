import '../../../routes/app_routes.dart';
import '../models/role_model.dart';

import 'package:get/get.dart';

class DashboardController extends GetxController {
  final RxString selectedRole = 'Coach'.obs;

  final List<RoleModel> roles = [
    RoleModel(
      id: "Technical Director",
      title: "Technical\nDirector (TD)",
      assetPath: 'assets/icons/ic_group_role.png',
      route: AppRoutes.technicalDirectorHome,
    ),
    RoleModel(
      id: "Director of Coaching",
      title: "Director of\nCoaching (DOC)",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.directorOfCoachingHome,
    ),
    RoleModel(
      id: "Age Group Coordinator",
      title: "Age Group\nCoordinator\n(AGC)",
      assetPath: 'assets/icons/ic_single_role.png',
    ),
    RoleModel(
      id: "Specialty Director",
      title: "Specialty Director",
      assetPath: 'assets/icons/ic_single_role.png',
    ),
    RoleModel(
      id: "Coach",
      title: "Coach",
      assetPath: 'assets/icons/ic_group_role.png',
      // route: AppRoutes.home, // Removed to force Login
    ),
    RoleModel(
      id: "Player",
      title: "Player",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.playerHome,
    ),
    RoleModel(
      id: "Parent",
      title: "Parent",
      assetPath: 'assets/icons/ic_single_role.png',
    ),
    RoleModel(
      id: "Field Scheduling Director",
      title: "Field Scheduling\nDirector",
      assetPath: 'assets/icons/ic_single_role.png',
    ),
    RoleModel(
      id: "Billing",
      title: "TD AI —\nSOFTWARE\nADD-ON BILLING",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.billing,
    ),
    RoleModel(
      id: "Tryouts",
      title: "TRYOUTS\nMODULE",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.tryouts,
    ),
    RoleModel(
      id: "Clinics",
      title: "CLINICS &\nCAMPS MODULE",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.clinics,
    ),
    RoleModel(
      id: "Evaluation",
      title: "EVALUATION\nSYSTEM",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.evaluation,
    ),
    RoleModel(
      id: "Surveys",
      title: "SURVEYS\nMODULE",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.surveys,
    ),
    RoleModel(
      id: "Digital Product Hub",
      title: "Digital Product\nHub",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.digitalProductHub,
    ),
    RoleModel(
      id: "AI Communication",
      title: "AI\nCOMMUNICATION",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.aiCommunicationHub,
    ),
    RoleModel(
      id: "Permissions",
      title: "PERMISSIONS &\nROLE\nASSIGNMENT",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.permissions,
    ),
    RoleModel(
      id: "Club Setup",
      title: "CLUB SETUP &\nGOVERNANCE",
      assetPath: "assets/icons/ic_group_role.png",
      route: AppRoutes.teamManagement, // Best guess for Command Center
      isFeatured: true,
    ),
  ];

  // Player & Family Hub Local State
  final RxString familyHubSelection = 'Player'.obs;

  void selectFamilyHubRole(String role) {
    familyHubSelection.value = role;
  }

  void proceedToAuthFromHub() {
    selectRole(familyHubSelection.value);
  }

  void selectRole(String roleId) {
    // Find the role model
    RoleModel? role = roles.firstWhereOrNull((r) => r.id == roleId);

    if (role == null) return;

    selectedRole.value = roleId;

    // We mostly go to login now, passing the intended route if present
    Get.toNamed(
      AppRoutes.login,
      arguments: {'role': roleId, 'redirect': role.route},
    );
  }
}
