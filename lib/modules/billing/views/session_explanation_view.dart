import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../home/controllers/home_controller.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../../../global_widgets/custom_back_button.dart';

class SessionExplanationView extends StatelessWidget {
  const SessionExplanationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      headerHeight: 120.h,
      headerContent: _buildHeaderContent(),
      backgroundColor: const Color(0xFFF9F9F9),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoCard(
                  title: 'What We Trained Today',
                  subtitle:
                      'A brief explanation of exercises or activities trained.',
                  backgroundColor: const Color(0xFF012356),
                  textColor: Colors.white,
                  icon: Icons
                      .notifications_none_outlined, // Placeholder for the bell icon
                  iconColor: const Color(0xFF012356),
                  iconBgColor: const Color(0xFFFEFEFE),
                ),
                SizedBox(height: 16.h),
                _buildInfoCard(
                  title: 'Why It Matter',
                  subtitle: 'Short summary of the importance and benefits.',
                  backgroundColor: const Color(0xFFEAF2FD),
                  textColor: const Color(0xFF012355),
                  icon: Icons.lightbulb_outline,
                  iconColor: const Color(0xFF012356),
                  iconBgColor: const Color(0xFFFEFEFE),
                ),
                SizedBox(height: 16.h),
                _buildInfoCard(
                  title: 'How to Support Your Child',
                  subtitle:
                      'Suggestions or tips for parents to help continue development.',
                  backgroundColor: const Color(0xFFEAF2FD),
                  textColor: const Color(0xFF012355),
                  icon: Icons.favorite_border,
                  iconColor: const Color(0xFF012356),
                  iconBgColor: const Color(0xFFFEFEFE),
                ),
                SizedBox(height: 80.h),
              ],
            ),
          ),
          Positioned(right: 0, bottom: 20.h, child: _buildCoachMessageButton()),
        ],
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
        } else {
          return null;
        }
      }(),
    );
  }

  Widget _buildHeaderContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        children: [
          const CustomBackButton(iconColor: Colors.black),
          SizedBox(width: 16.w),
          Text(
            'Session Explanation',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String subtitle,
    required Color backgroundColor,
    required Color textColor,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: Icon(icon, color: iconColor, size: 24.w),
            ),
          ),
          SizedBox(width: 13.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoachMessageButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h, right: 20.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 160.w,
            padding: EdgeInsets.all(12.w),
            decoration: ShapeDecoration(
              color: const Color(0xFF40D0BC),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 146.w,
                  child: Text(
                    'Wanted to know how you child doing? message the coach',
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 8.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.50,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 42.36.w,
                height: 42.87.w,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 3.34.h,
                      child: Container(
                        width: 35.62.w,
                        height: 35.62.w,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF012356),
                          shape: OvalBorder(),
                        ),
                        child: Center(
                          child: Text(
                            'Coach',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
