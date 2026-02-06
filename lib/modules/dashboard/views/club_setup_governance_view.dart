import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global_widgets/base_scaffold.dart';
import '../../../../core/utils/size_utils.dart';
import '../../home/controllers/home_controller.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/dashboard_controller.dart';

class ClubSetupGovernanceView extends GetView<DashboardController> {
  const ClubSetupGovernanceView({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<HomeController>()) {
      Get.find<HomeController>().currentHomeRoute.value =
          AppRoutes.clubSetupGovernance;
    }

    return BaseScaffold(
      showHeader: false,
      backgroundColor: const Color(0xFFEDF5FF),
      showBottomNav: true,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                child: Column(
                  children: [
                    _buildMenuTile(
                      label: "Club Info",
                      icon: Icons.featured_play_list_outlined,
                      onTap: () => Get.toNamed(AppRoutes.clubInfo),
                    ),
                    _buildMenuTile(
                      label: "Full Club Hierarchy",
                      icon: Icons.account_balance_outlined,
                      onTap: () => Get.toNamed(AppRoutes.clubHierarchy),
                    ),
                    _buildMenuTile(
                      label: "Team Tiers",
                      icon: Icons.groups_outlined,
                      onTap: () => Get.toNamed(AppRoutes.teamTiers),
                    ),
                    _buildMenuTile(
                      label: "Training Frequency Setup",
                      icon: Icons.timer_outlined,
                      onTap: () {},
                    ),
                    _buildMenuTile(
                      label: "Methodology Upload",
                      icon: Icons.upload_file_outlined,
                      onTap: () {},
                    ),
                    _buildMenuTile(
                      label: "Seasonal Planing",
                      icon: Icons.account_tree_outlined,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 20.h,
        bottom: 30.h,
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
            blurRadius: 10.w,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 51.w,
            height: 51.w,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: Colors.white),
              image: const DecorationImage(
                image: AssetImage('assets/icons/Ellipse13.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    color: const Color(0xFFFEFEFE),
                    fontSize: 18.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  'CLUB SETUP & GOVERNANCE',
                  style: TextStyle(
                    color: const Color(0xFFFEFEFE),
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.notifications_none,
                color: Color(0xFF012356),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuTile({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      height: 78.h,
      decoration: BoxDecoration(
        color: const Color(0xFFFEFEFE),
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0x28000000),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9F9F9),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(icon, size: 24.w, color: const Color(0xFF012356)),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20.w,
                  color: const Color(0xFF012356),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
