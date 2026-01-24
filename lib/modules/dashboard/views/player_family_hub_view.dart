import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_back_button.dart';
import '../../../core/utils/size_utils.dart';
import '../controllers/dashboard_controller.dart';

class PlayerFamilyHubView extends GetView<DashboardController> {
  const PlayerFamilyHubView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                  children: [
                    const CustomBackButton(),
                    const Spacer(),
                    const Text(
                      'Player & Family Hub',
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

              // Selection Cards
              Row(
                children: [
                  Expanded(
                    child: _buildSelectionCard(
                      title: 'Parent',
                      iconPath: 'assets/icons/ic_single_role.png',
                      roleId: 'Parent', // Pass roleId for check
                      onTap: () => controller.selectFamilyHubRole('Parent'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildSelectionCard(
                      title: 'Player',
                      iconPath: 'assets/icons/ic_single_role.png',
                      roleId: 'Player',
                      onTap: () => controller.selectFamilyHubRole('Player'),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectionCard({
    required String title,
    required String iconPath,
    required String roleId,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120.h,
        decoration: BoxDecoration(
          color: Colors.white,
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
            // Icon
            Image.asset(
              iconPath,
              width: 40.w,
              height: 40.w,
              color: const Color(0xFF031945),
            ),
            SizedBox(height: 12.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF031945),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
