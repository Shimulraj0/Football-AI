import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../global_widgets/base_scaffold.dart';
import '../../../../global_widgets/profile_image.dart';

import '../../../../core/utils/size_utils.dart';

import '../controllers/dashboard_controller.dart';

class ClubCommandCenterView extends GetView<DashboardController> {
  const ClubCommandCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: false,
      backgroundColor: const Color(0xFFEDF5FF),
      body: Column(
        children: [
          _buildCustomHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                children: [
                  _buildMenuTile(
                    icon: Icons.chrome_reader_mode_outlined,
                    label: "Club Info",
                    onTap: () =>
                        controller.handleCommandCenterAction("Club Info"),
                  ),
                  _buildMenuTile(
                    icon: Icons.warehouse_rounded, // Home hierarchy icon
                    label: "Full Club Hierarchy",
                    onTap: () => controller.handleCommandCenterAction(
                      "Full Club Hierarchy",
                    ),
                  ),
                  _buildMenuTile(
                    icon: Icons.people_outline,
                    label: "Team Tiers",
                    onTap: () =>
                        controller.handleCommandCenterAction("Team Tiers"),
                  ),
                  _buildMenuTile(
                    icon: Icons.timer_outlined,
                    label: "Training Frequency Setup",
                    onTap: () => controller.handleCommandCenterAction(
                      "Training Frequency Setup",
                    ),
                  ),
                  _buildMenuTile(
                    icon: Icons.calendar_today_outlined,
                    label: "Methodology Upload",
                    onTap: () => controller.handleCommandCenterAction(
                      "Methodology Upload",
                    ),
                  ),
                  _buildMenuTile(
                    icon: Icons.account_tree_outlined,
                    label: "Seasonal Planing",
                    onTap: () => controller.handleCommandCenterAction(
                      "Seasonal Planing",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 50.h,
        left: 20.w,
        right: 20.w,
        bottom: 30.h,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF012356),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
        children: [
          // Profile Image
          ProfileImage(
            imagePath: 'assets/icons/Ellipse13.png',
            size: 50.w,
            onTap: () {},
          ),
          SizedBox(width: 16.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Wrap content
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "CLUB SETUP & GOVERNANCE",
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),

          // Notification Icon
          Material(
            color: Colors.white,
            shape: const CircleBorder(),
            child: InkWell(
              onTap: () {
                // Handle notification tap
              },
              customBorder: const CircleBorder(),
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: SvgPicture.asset(
                  "assets/icons/Notification.svg",
                  width: 20.w,
                  height: 20.w,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF012356),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuTile({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Row(
              children: [
                // Icon Box
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: const Color(0xFF0144A9), // Blue icon color
                    size: 24.w,
                  ),
                ),
                SizedBox(width: 16.w),

                // Label
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),

                // Arrow
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: const Color(0xFF012356),
                  size: 16.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
