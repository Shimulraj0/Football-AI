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

              // Top Row: Billing (Filled) & Digital Product Hub (Outlined)
              Row(
                children: [
                  Expanded(
                    child: _buildCard(
                      title: 'TD AI —\nSOFTWARE\nADD-ON BILLING',
                      isFilled: true,
                      onTap: () => controller.selectRole('Billing'),
                      icon: Icons.person_outline, // Placeholder icon
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: _buildCard(
                      title: 'Digital Product\nHub',
                      isFilled: false,
                      onTap: () => controller.selectRole('Digital Product Hub'),
                      icon: Icons.person_outline, // Placeholder icon
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),

              // Bottom Row: Permissions (Outlined)
              Row(
                children: [
                  Expanded(
                    child: _buildCard(
                      title: 'PERMISSIONS &\nROLE\nASSIGNMENT',
                      isFilled: false,
                      onTap: () => controller.selectRole('Permissions'),
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
    required IconData icon,
    String? roleId, // Added roleId for selection matching
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(() {
        // Determine selection state
        // Note: For operations, 'isFilled' was the original default style.
        // We now prioritize selection state.
        final matchingId =
            roleId ?? title.replaceAll('\n', ' '); // Fallback to title if no ID
        final isSelected =
            controller.operationsAdminSelection.value == matchingId;

        // If selected, it should be blue (filled).
        // If originally filled, it stays filled unless we want to toggle?
        // User request: "blue outline when selected".
        // Actually for Operations:
        // Originally: Some cards filled (Billing), others outline.
        // User wants visual feedback.
        // If I tap an outline card, it should probably fill or outline blue.
        // Let's make it fill blue on selection like the others.

        // Effective Filled State:
        final bool effectiveFilled = isFilled || isSelected;

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
              // Icon Placeholder
              Container(
                width: 30.w,
                height: 30.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: effectiveFilled
                        ? Colors.white
                        : const Color(0xFF031945),
                    width: 1,
                  ),
                ),
                // Just a placeholder icon since assets weren't provided in snippet
                child: Icon(
                  icon,
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
