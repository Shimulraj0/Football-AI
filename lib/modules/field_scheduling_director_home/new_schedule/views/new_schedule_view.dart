import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../global_widgets/custom_back_button.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/new_schedule_controller.dart';

class NewScheduleView extends GetView<NewScheduleController> {
  const NewScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      headerContent: _buildHeader(),
      showBottomNav: true, // Assuming navigation needs to persist
      // Use Stack to position content or simply set body
      // Given the design shows a back button and "New Schedule" title in a custom blue header at top,
      // and base scaffold has its own header structure.
      // The design requested has a VERY specific custom header with a back button.
      // BaseScaffold might conflict if it enforces a specific header.
      // However, BaseScaffold.headerContent allows passing a custom widget.
      // The design shows a blue container with "New Schedule" and back button.
      body: Column(
        children: [
          // The provided design has a specific header style.
          // However BaseScaffold usually handles the top part.
          // If BaseScaffold wraps everything in SafeArea, we might need to adjust.
          // Let's implement the body content based on the user's snippet, adapted.
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              children: [
                _buildSelectionCard(
                  icon: Icons.calendar_today_outlined,
                  title: "Select Date Range",
                  subtitle: "Pick the dates you want to schedule.",
                  onTap: () {
                    Get.toNamed(AppRoutes.selectDateRange);
                  },
                ),
                SizedBox(height: 16.h),
                _buildSelectionCard(
                  icon: Icons.people_outline,
                  title: "Select Age Groups & Teams",
                  subtitle: "U9-U12 All Teams",
                  onTap: () {
                    Get.toNamed(AppRoutes.selectAgeGroup);
                  },
                ),
                SizedBox(height: 16.h),
                _buildSelectionCard(
                  icon: Icons.crop_free, // Closest to the select field icon
                  title: "Select Available Fields",
                  subtitle: "All Fields",
                  onTap: () {
                    Get.toNamed(AppRoutes.selectAvailableFields);
                  },
                ),
                SizedBox(height: 40.h),
                _buildAddButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 13.h),
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          CustomBackButton(
            onPressed: () => Get.back(),
            backgroundColor: Colors.white,
            iconColor: const Color(0xFF012355),
          ),
          Expanded(
            child: Center(
              child: Text(
                "New Schedule",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                ),
              ),
            ),
          ),
          SizedBox(width: 40.w), // Balance the back button
        ],
      ),
    );
  }

  Widget _buildSelectionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: const Color(0xFFF9F9F9),
                borderRadius: BorderRadius.circular(8.w),
              ),
              child: Icon(icon, color: const Color(0xFF575757), size: 24.w),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: const Color(0xFF012356).withValues(alpha: 0.6),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: const Color(0xFF012356),
              size: 24.w,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3064AB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.w),
          ),
          elevation: 0,
        ),
        child: Text(
          'Add Scheduling',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
      ),
    );
  }
}
