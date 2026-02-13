import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../global_widgets/custom_back_button.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../routes/app_routes.dart';

class OperationsAdminSelectionView extends StatelessWidget {
  const OperationsAdminSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "Operations & Admin",
      // Custom leading to ensure back button is visible on white background if design requires distinct style
      // or to override BaseScaffold default behavior if needed.
      // Based on screenshot, back button is white circle with dark icon.
      leading: CustomBackButton(
        backgroundColor: Colors.white,
        iconColor: AppColors.primary,
        onPressed: () => Get.back(),
      ),
      showBackButton: true,
      showBottomNav: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildSelectionCard(
                    title: "TD AI —\nSOFTWARE\nADD-ON BILLING",
                    icon: Icons.person_outline,
                    isSelected: true,
                    onTap: () => Get.toNamed(AppRoutes.billing),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: _buildSelectionCard(
                    title: "Digital Product\nHub",
                    icon: Icons.person_outline,
                    isSelected: false,
                    onTap: () => Get.toNamed(AppRoutes.digitalProductHub),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: _buildSelectionCard(
                    title: "PERMISSIONS &\nROLE\nASSIGNMENT",
                    icon: Icons.person_outline,
                    isSelected: false,
                    onTap: () => Get.toNamed(AppRoutes.operationsAdmin),
                  ),
                ),
                SizedBox(width: 16.w),
                const Expanded(
                  child: SizedBox(),
                ), // Placeholder for grid alignment
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionCard({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    // Style based on selection state to match screenshot
    final backgroundColor = isSelected ? AppColors.primary : Colors.white;
    final foregroundColor = isSelected ? Colors.white : AppColors.primary;
    final borderColor = AppColors.primary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height:
            160.h, // Adjusted height to match screenshot aspect ratio better
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.w),
          border: Border.all(color: borderColor, width: 1.5),
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
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: foregroundColor, width: 1.5),
              ),
              child: Icon(icon, color: foregroundColor, size: 28.w),
            ),
            SizedBox(height: 16.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: foregroundColor,
                fontSize: 13.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
