import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_back_button.dart';
import '../../../core/utils/size_utils.dart';
import '../controllers/dashboard_controller.dart';
import '../models/role_model.dart';

class StaffWorkspaceView extends GetView<DashboardController> {
  const StaffWorkspaceView({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the list of roles to display in the grid
    final List<String> staffRoles = [
      "Age Group Coordinator",
      "Specialty Director",
      "Coach",
      "Tryouts",
      "Field Scheduling Director",
      "Evaluation",
      "Clinics",
      "Surveys",
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    const CustomBackButton(),
                    const Spacer(),
                    const Text(
                      'Staff Workspace',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(width: 40), // Balance back button
                  ],
                ),
              ),

              // Grid of Roles
              Expanded(
                child: GridView.builder(
                  itemCount: staffRoles.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 160 / 120,
                  ),
                  itemBuilder: (context, index) {
                    final roleId = staffRoles[index];
                    // Find the role model to get title/icon, or provide default
                    final roleModel =
                        controller.roles.firstWhereOrNull(
                          (r) => r.id == roleId,
                        ) ??
                        RoleModel(
                          id: roleId,
                          title: roleId,
                          assetPath:
                              'assets/icons/ic_single_role.png', // Fallback
                        );

                    return _buildStaffOption(
                      title: roleModel.title,
                      iconPath: roleModel.assetPath,
                      roleId: roleId,
                      onTap: () => controller.selectStaffRole(roleId),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStaffOption({
    required String title,
    required String iconPath,
    required String roleId,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTapDown: (_) => controller.staffWorkspaceSelection.value = roleId,
      onTapCancel: () => controller.staffWorkspaceSelection.value = '',
      onTap: onTap,
      child: Obx(() {
        final isSelected = controller.staffWorkspaceSelection.value == roleId;
        final backgroundColor = isSelected
            ? const Color(0xFF031945)
            : Colors.white;
        final contentColor = isSelected
            ? Colors.white
            : const Color(0xFF031945); // Unified to primary
        final borderColor = const Color(0xFF031945);

        return Container(
          height: 120.h,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10.w),
            border: isSelected
                ? Border.all(color: Colors.transparent, width: 1)
                : Border.all(color: borderColor, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon
              Image.asset(
                iconPath,
                width: 36.w,
                height: 36.w,
                color: contentColor,
              ),
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: contentColor,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
