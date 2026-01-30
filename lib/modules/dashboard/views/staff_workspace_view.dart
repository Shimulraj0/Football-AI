import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global_widgets/base_scaffold.dart';
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

    return BaseScaffold(
      title: "Staff Workspace",
      showBackButton: true,
      backgroundColor: const Color(0xFFEEF5FF),
      showBottomNav: true,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Header
            // Header removed to avoid duplication with BaseScaffold title

            // Grid of Roles
            Expanded(
              child: GridView.builder(
                itemCount: staffRoles.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio:
                      160 / 140, // Increased height to prevent overflow
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
    );
  }

  Widget _buildStaffOption({
    required String title,
    required String iconPath,
    required String roleId,
    required VoidCallback onTap,
  }) {
    return _StaffRoleCard(title: title, iconPath: iconPath, onTap: onTap);
  }
}

class _StaffRoleCard extends StatefulWidget {
  final String title;
  final String iconPath;
  final VoidCallback onTap;

  const _StaffRoleCard({
    required this.title,
    required this.iconPath,
    required this.onTap,
  });

  @override
  State<_StaffRoleCard> createState() => _StaffRoleCardState();
}

class _StaffRoleCardState extends State<_StaffRoleCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    const pressedColor = Color(0xFF012356);
    const defaultColor = Colors.white;
    const pressedTextColor = Colors.white;
    const defaultTextColor = Color(0xFF031945);

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: Container(
        height: 120.h,
        decoration: BoxDecoration(
          color: _isPressed ? pressedColor : defaultColor,
          borderRadius: BorderRadius.circular(10.w),
          border: Border.all(color: const Color(0xFF031945), width: 1),
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
            Image.asset(
              widget.iconPath,
              width: 36.w,
              height: 36.w,
              color: _isPressed ? Colors.white : null,
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: _isPressed ? pressedTextColor : defaultTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
