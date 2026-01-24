import '../../../routes/app_routes.dart';
import '../models/role_model.dart';
import 'package:get/get.dart';
import '../../home/controllers/home_controller.dart';

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
      id: "Specialty Director", // Matched with StaffWorkspaceView list
      title: "Specialty\nDirector",
      assetPath: 'assets/icons/ic_speciality_director.png',
      route: AppRoutes.specialtyDirectorHome,
    ),
    RoleModel(
      id: "Age Group Coordinator",
      title: "Age Group\nCoordinator",
      assetPath: 'assets/icons/ic_single_role.png',
      route: AppRoutes.assignedAgeGroups,
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
      // Update HomeController's current route so bottom nav Home button knows where to go
      if (Get.isRegistered<HomeController>()) {
        Get.find<HomeController>().currentHomeRoute.value = role.route!;
        Get.find<HomeController>().selectedIndex.value = 0; // Reset tab to Home
      }

      Get.toNamed(role.route!);
    }
  }

  // Restoring missing methods based on usage in other views
  void selectClubRole(String roleId) {
    switch (roleId) {
      case 'Technical Director':
        Get.toNamed(AppRoutes.technicalDirectorHome);
        break;
      case 'Director of Coaching':
        Get.toNamed(AppRoutes.directorOfCoachingHome);
        break;
      case 'Permissions':
        Get.toNamed(AppRoutes.permissions);
        break;
      case 'Club Setup':
        Get.snackbar(
          'Coming Soon',
          'Club Setup & Governance is under development',
        );
        break;
    }
  }

  void selectFamilyHubRole(String roleId) {
    switch (roleId) {
      case 'Parent':
        Get.toNamed(AppRoutes.parentPlayerPortal);
        break;
      case 'Player':
        Get.toNamed(AppRoutes.playerHome);
        break;
    }
  }
}
