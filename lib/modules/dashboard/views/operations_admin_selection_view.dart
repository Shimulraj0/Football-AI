import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../routes/app_routes.dart';

class OperationsAdminSelectionView extends StatelessWidget {
  const OperationsAdminSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "Operations & Admin",
      showBackButton: true,
      showBottomNav: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildSelectionCard(
                    title: "TD AI —\nSOFTWARE\nADD-ON BILLING",
                    icon: Icons.person_outline,
                    isSelected: false,
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
                    title: "Operation & Billing",
                    icon: Icons.person_outline,
                    isSelected: true,
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
    final effectiveBackgroundColor = isSelected
        ? const Color(0xFF012355)
        : Colors.white;
    final borderColor = const Color(0xFF012355);
    final foregroundColor = isSelected ? Colors.white : const Color(0xFF012355);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150.h, // Approximate square height
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: effectiveBackgroundColor,
          borderRadius: BorderRadius.circular(12.w),
          border: Border.all(color: borderColor, width: 1.5),
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
            SizedBox(height: 12.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: foregroundColor,
                fontSize: 14.sp,
                fontFamily: 'Inter', // Assuming global font
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
