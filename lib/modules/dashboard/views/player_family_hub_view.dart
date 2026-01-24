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
      onTapDown: (_) => controller.familyHubSelection.value = roleId,
      onTapCancel: () => controller.familyHubSelection.value = '',
      onTap: onTap,
      child: Obx(() {
        final isSelected = controller.familyHubSelection.value == roleId;
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
            border: Border.all(color: borderColor, width: 1),
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
                width: 48
                    .w, // Increased size slightly as padding is gone, or keep 24.w? Let's check design intent. Usually if border is gone, icon might need to be bigger or same. I will keep it same but maybe adjust if needed.
                // Wait, the previous container had padding 12.w and child 24.w. So total box was 24 + 12*2 = 48.
                // If I just show 24.w icon it might look small.
                // I will set it to 48.w or maybe just remove the border.
                // "remove the rectangle shape".
                // I'll stick to 24.w first (or slightly larger 40.w?)
                // Let's assume just removing the border is key. I'll use 40.w to be safe visually.
                height: 40.w,
                color: contentColor,
              ),
              SizedBox(height: 12.h),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: contentColor,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
