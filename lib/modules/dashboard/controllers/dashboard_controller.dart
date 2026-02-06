import '../../../routes/app_routes.dart';
import '../models/role_model.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final RxString selectedRole = 'Coach'.obs;

  // State variables for sub-dashboards removed as per user request (direct navigation now)

  final List<RoleModel> roles = [
    RoleModel(
      id: "Technical Director",
      title: "Technical\nDirector (TD)",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.technicalDirectorHome,
    ),
    RoleModel(
      id: "Director of Coaching",
      title: "Director of\nCoaching (DOC)",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.directorOfCoachingHome,
    ),
    RoleModel(
      id: "Field Scheduling Director",
      title: "Field Scheduling\nDirector",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.fieldSchedulingDirector,
    ),
    RoleModel(
      id: "Specialty Director", // Matched with StaffWorkspaceView list
      title: "Specialty\nDirector",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.specialtyDirectorHome,
    ),
    RoleModel(
      id: "Age Group Coordinator",
      title: "Age Group\nCoordinator",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.ageGroupCoordinatorHome,
    ),
    RoleModel(
      id: "Coach",
      title: "Coach",
      assetPath: 'assets/icons/ic_single_role.png',
      // No specific route, likely stays on dashboard or handled via sub-selection
    ),
    RoleModel(
      id: "Tryouts",
      title: "Tryouts",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.tryouts,
    ),
    RoleModel(
      id: "Clinics",
      title: "Clinics",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.clinics,
    ),
    RoleModel(
      id: "Evaluation", // Evaluation Director? Or just evaluation module
      title: "Evaluation",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.evaluation,
    ),
    RoleModel(
      id: "Surveys",
      title: "Surveys",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.surveys,
    ),
  ];

  void selectStaffRole(String roleId) {
    selectedRole.value = roleId; // Main dashboard role?

    // Check for route navigation first
    final role = roles.firstWhereOrNull((r) => r.id == roleId);
    if (role != null && role.route != null) {
      // Navigate to Login with redirect arguments
      Get.toNamed(
        AppRoutes.login,
        arguments: {'role': role.title, 'redirect': role.route},
      );
    }
  }

  void selectClubRole(String roleId) {
    selectedRole.value = roleId;
    String? redirect;
    switch (roleId) {
      case 'Technical Director':
        redirect = AppRoutes.technicalDirectorHome;
        break;
      case 'Director of Coaching':
        redirect = AppRoutes.directorOfCoachingHome;
        break;
      case 'Permissions':
        redirect = AppRoutes.permissions;
        break;
      case 'Club Setup':
        redirect = AppRoutes.clubSetupGovernance;
        break;
    }

    if (redirect != null) {
      Get.toNamed(
        AppRoutes.login,
        arguments: {'role': roleId, 'redirect': redirect},
      );
    }
  }

  void selectFamilyHubRole(String roleId) {
    String? redirect;
    switch (roleId) {
      case 'Parent':
        redirect = AppRoutes.parentPlayerPortal;
        break;
      case 'Player':
        redirect = AppRoutes.playerHome;
        break;
    }

    if (redirect != null) {
      Get.toNamed(
        AppRoutes.login,
        arguments: {'role': roleId, 'redirect': redirect},
      );
    }
  }
}
