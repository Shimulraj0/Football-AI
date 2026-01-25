import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/custom_back_button.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/assigned_age_groups_controller.dart';

// Moved from AssignedAgeGroupsView to Detail View
class AgeGroupDetailView extends GetView<AssignedAgeGroupsController> {
  const AgeGroupDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF5FF), // Light background
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 20.h),
            _buildWeeklyOverviewCard(),
            SizedBox(height: 16.h),
            _buildSessionHealth(),
            SizedBox(height: 16.h),
            _buildCoachSubmissions(),
            SizedBox(height: 16.h),
            _buildWeeklyFocus(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
      bottomNavigationBar: () {
        if (Get.isRegistered<HomeController>()) {
          final homeController = Get.find<HomeController>();
          return Obx(
            () => CustomBottomNavBar(
              selectedIndex: homeController.selectedIndex.value,
              onItemTapped: homeController.changeTabIndex,
            ),
          );
        }
        return null;
      }(),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 60.h,
        left: 20.w,
        right: 20.w,
        bottom: 20.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF012355),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.w),
          bottomRight: Radius.circular(32.w),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1E000000),
            blurRadius: 10.h,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomBackButton(
                onPressed: () => Get.back(),
                backgroundColor: Colors.white,
                iconColor: const Color(0xFF00204A),
              ),
              const Spacer(),
              Text(
                'Weekly Overview',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              SizedBox(width: 48.w), // Balance back button
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyOverviewCard() {
    return Container(
      width: 335.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0x28000000),
            blurRadius: 6.w,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Weekly Overview',
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'U9-U12 Age Group',
            style: TextStyle(
              color: const Color(0xCC012356),
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStatBox(
                title: 'Session',
                subtitle: 'This Week',
                value: '9',
                isChart: true,
              ),
              SizedBox(width: 16.w),
              _buildStatBox(
                title: 'Attendance',
                subtitle: 'Rate',
                value: '82%',
                status: 'Stable',
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F2F6),
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: Text(
              'Based on session observations & coach input',
              style: TextStyle(
                color: const Color(0xCC012356),
                fontSize: 12.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatBox({
    required String title,
    required String subtitle,
    required String value,
    bool isChart = false,
    String? status,
  }) {
    return Container(
      width: 98.w,
      height: 114.h,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black.withValues(alpha: 0.1)),
        borderRadius: BorderRadius.circular(8.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0x19000000),
            blurRadius: 6.w,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 14.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: const Color(0x99012356),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          if (isChart)
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0260ED),
                      borderRadius: BorderRadius.circular(2.w),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE1E1E1),
                      borderRadius: BorderRadius.circular(2.w),
                    ),
                  ),
                ),
              ],
            )
          else if (status != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: const Color(0xFFDBEEEB),
                borderRadius: BorderRadius.circular(8.w),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: const Color(0xFF06475E),
                  fontSize: 10.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSessionHealth() {
    return Container(
      width: 335.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0x28000000),
            blurRadius: 6.w,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.check_circle,
                color: const Color(0xFF5DC281),
                size: 24.w,
              ),
              SizedBox(width: 8.w),
              Text(
                'Session Health',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'Based on session observations & coach input',
            style: TextStyle(
              color: const Color(0xCC012356),
              fontSize: 12.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoachSubmissions() {
    return Container(
      width: 335.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0x28000000),
            blurRadius: 6.w,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Coach Submissions',
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),
          _buildCoachRow(
            name: 'Coach A',
            status: 'Submitted',
            approval: 'Approved',
            approvalColor: const Color(0xFF5DC281),
            approvalIcon: Icons.check,
          ),
          SizedBox(height: 12.h),
          _buildCoachRow(
            name: 'Coach B',
            status: 'Submitted',
            approval: 'Pending',
            approvalColor: const Color(0xFFE1B03C),
            approvalIcon: Icons.error_outline,
          ),
        ],
      ),
    );
  }

  Widget _buildCoachRow({
    required String name,
    required String status,
    required String approval,
    required Color approvalColor,
    required IconData approvalIcon,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.check_circle,
              color: const Color(0xFF5DC281),
              size: 20.w,
            ),
            SizedBox(width: 8.w),
            SizedBox(
              width: 60.w,
              child: Text(
                name,
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 14.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        Text(
          status,
          style: TextStyle(
            color: const Color(0xCC012356),
            fontSize: 14.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        Row(
          children: [
            Text(
              approval,
              style: TextStyle(
                color: approvalColor,
                fontSize: 14.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: 4.w),
            Icon(approvalIcon, color: approvalColor, size: 16.w),
          ],
        ),
      ],
    );
  }

  Widget _buildWeeklyFocus() {
    return Container(
      width: 335.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0x28000000),
            blurRadius: 6.w,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.check_circle,
                color: const Color(0xFFE1B03C), // Orange/Gold check for focus
                size: 24.w,
              ),
              SizedBox(width: 8.w),
              Text(
                'Weekly Focus',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              _buildTag('Ball Progression'),
              SizedBox(width: 10.w),
              _buildTag('Defensive Shape'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F6),
        borderRadius: BorderRadius.circular(4.w),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: const Color(0xFF012356),
          fontSize: 12.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
