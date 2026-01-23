import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global_widgets/base_scaffold.dart';
import '../../../../global_widgets/custom_back_button.dart';
import '../../../../core/utils/size_utils.dart';

import '../controllers/dashboard_controller.dart';

class OperationsAdminView extends GetView<DashboardController> {
  const OperationsAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: false,
      backgroundColor: const Color(
        0xFFF5F9FF,
      ), // Light blueish background from snippet
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Custom Header with Back Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(
                    onPressed: () => Get.back(),
                    backgroundColor: Colors.white,
                    iconColor: const Color(0xFF012356),
                  ),
                  Text(
                    'Operations & Admin',
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 18.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // Placeholder for spacing to balance the center title
                  SizedBox(width: 40.w),
                ],
              ),
              SizedBox(height: 30.h),

              // Top Row: Billing & Digital Product Hub
              Row(
                children: [
                  Expanded(
                    child: _buildCard(
                      title: 'TD AI —\nSOFTWARE\nADD-ON BILLING',
                      isFilled: false,
                      roleId: 'Billing',
                      onTap: () => controller.selectOperationsRole('Billing'),
                      icon: Icons.person_outline, // Placeholder icon
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: _buildCard(
                      title: 'Digital Product\nHub',
                      isFilled: false,
                      roleId: 'Digital Product Hub',
                      onTap: () => controller.selectOperationsRole(
                        'Digital Product Hub',
                      ),
                      icon: Icons.person_outline, // Placeholder icon
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),

              // Bottom Row: Permissions
              Row(
                children: [
                  Expanded(
                    child: _buildCard(
                      title: 'PERMISSIONS &\nROLE\nASSIGNMENT',
                      isFilled: false,
                      roleId: 'Permissions',
                      onTap: () =>
                          controller.selectOperationsRole('Permissions'),
                      icon: Icons.person_outline, // Placeholder icon
                    ),
                  ),
                  SizedBox(width: 15.w),
                  const Expanded(child: SizedBox()), // Empty slot
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required bool isFilled,
    required VoidCallback onTap,
    String? roleId, // Added roleId for selection matching
    IconData? icon, // Made optional, as we prefer asset from role
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(() {
        // Determine selection state
        final matchingId =
            roleId ?? title.replaceAll('\n', ' '); // Fallback to title if no ID
        final isSelected =
            controller.operationsAdminSelection.value == matchingId;

        // Effective Filled State:
        final bool effectiveFilled = isFilled || isSelected;

        // Find the role model to get the asset
        final roleModel = controller.roles.firstWhereOrNull(
          (r) => r.id == matchingId,
        );
        final assetPath = roleModel?.assetPath;

        return Container(
          height: 120.h,
          padding: EdgeInsets.all(10.w),
          decoration: ShapeDecoration(
            color: effectiveFilled ? const Color(0xFF031945) : Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: const Color(0xFF031945)),
              borderRadius: BorderRadius.circular(10.w),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon / Image
              Container(
                width: 40.w, // Slightly larger container
                height: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: effectiveFilled
                        ? Colors.white
                        : const Color(0xFF031945),
                    width: 1,
                  ),
                ),
                padding: EdgeInsets.all(8.w), // Padding inside the circle
                child: assetPath != null
                    ? Image.asset(
                        assetPath,
                        color: effectiveFilled
                            ? Colors.white
                            : const Color(0xFF031945),
                        fit: BoxFit.contain,
                      )
                    : Icon(
                        icon ?? Icons.person,
                        color: effectiveFilled
                            ? Colors.white
                            : const Color(0xFF031945),
                        size: 18.w,
                      ),
              ),
              SizedBox(height: 10.h),
              // Text
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: effectiveFilled
                      ? Colors.white
                      : const Color(0xFF031945),
                  fontSize: 14.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
