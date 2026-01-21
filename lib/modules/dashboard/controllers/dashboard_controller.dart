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
      route: AppRoutes.home,
    ),
    RoleModel(
      id: "Specialty Director",
      title: "Specialty Director",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.home,
    ),
    RoleModel(
      id: "Coach",
      title: "Coach",
      assetPath: 'assets/icons/ic_group_role.png',
      route: AppRoutes.home,
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
      route: AppRoutes.playerHome, // Reuse Player Home for now or separate
    ),
    RoleModel(
      id: "Field Scheduling Director",
      title: "Field Scheduling\nDirector",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.home,
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
      title: "Operations &\nAdmin", // Updated title to match the Dashboard card
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.permissions,
    ),
    RoleModel(
      id: "Club Setup",
      title: "CLUB SETUP &\nGOVERNANCE",
      assetPath: "assets/icons/ic_group_role.png",
      route: AppRoutes.technicalDirectorHome, // Redirects to a real dashboard
      isFeatured: true, // Assuming this flag exists
    ),
  ];

  // Hub Selection State
  final RxString familyHubSelection = ''.obs;

  Future<void> selectFamilyHubRole(String role) async {
    familyHubSelection.value = role;
    // Short delay to allow the user to see the selection color
    await Future.delayed(const Duration(milliseconds: 200));
    selectRole(role);
    // Reset selection after navigation starts
    Future.delayed(const Duration(milliseconds: 500), () {
      familyHubSelection.value = '';
    });
  }

  // Staff Workspace Selection State
  final RxString staffWorkspaceSelection = ''.obs;

  Future<void> selectStaffRole(String role) async {
    staffWorkspaceSelection.value = role;
    // Short delay to allow the user to see the selection color
    await Future.delayed(const Duration(milliseconds: 200));
    selectRole(role);
    // Reset selection after navigation starts
    Future.delayed(const Duration(milliseconds: 500), () {
      staffWorkspaceSelection.value = '';
    });
  }

  // Club Command Center Selection State
  final RxString clubCommandCenterSelection = ''.obs;

  Future<void> selectClubRole(String role) async {
    clubCommandCenterSelection.value = role;
    await Future.delayed(const Duration(milliseconds: 200));
    selectRole(role);
    // Reset after delay
    Future.delayed(const Duration(milliseconds: 500), () {
      clubCommandCenterSelection.value = '';
    });
  }

  // Operations Admin Selection State
  final RxString operationsAdminSelection = ''.obs;

  Future<void> selectOperationsRole(String role) async {
    operationsAdminSelection.value = role;
    await Future.delayed(const Duration(milliseconds: 200));
    selectRole(role);
    // Reset after delay
    Future.delayed(const Duration(milliseconds: 500), () {
      operationsAdminSelection.value = '';
    });
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
