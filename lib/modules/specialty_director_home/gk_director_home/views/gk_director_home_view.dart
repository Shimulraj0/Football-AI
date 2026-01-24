import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../../../global_widgets/custom_back_button.dart';
import '../../../home/controllers/home_controller.dart';
import '../controllers/gk_director_home_controller.dart';

class GkDirectorHomeView extends GetView<GkDirectorHomeController> {
  const GkDirectorHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true, // Use persistent header
      headerHeight: 120.h, // visual height
      headerContent: _buildHeaderContent(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // _buildHeader(context), // Removed custom inline header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                children: [
                  _buildFocusCard(),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatCard("Programs", "4", "Active"),
                      _buildStatCard("Reviews", "2", ""),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  _buildNavCard(
                    title: "Curriculum",
                    subtitle: "4 Active",
                    icon: Icons.assignment, // Placeholder
                    onTap: () {},
                  ),
                  SizedBox(height: 16.h),
                  _buildNavCard(
                    title: "Evaluations",
                    subtitle: "2",
                    icon: Icons.checklist, // Placeholder
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 80.h),
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

  Widget _buildHeaderContent(BuildContext context) {
    // Return just the content row. PersistentHeader handles the decoration and status bar.
    // We add some padding for alignment within the safe area provided by PersistentHeader
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        children: [
          CustomBackButton(
            iconColor: const Color(0xFF012355),
            backgroundColor: Colors.white,
          ),
          Expanded(
            child: Center(
              child: Text(
                'GK Director',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(width: 40.w), // Balance back button
        ],
      ),
    );
  }

  Widget _buildFocusCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: ShapeDecoration(
        color: const Color(0xFFD6E6F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: [
          BoxShadow(
            color: Color(0x28000000),
            blurRadius: 6,
            offset: Offset(0, 3),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'This Week’s Focus',
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10.h),
          _buildBulletPoint('Shot stopping & footwork'),
          SizedBox(height: 6.h),
          _buildBulletPoint('Distribution under pressure'),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      children: [
        Container(
          width: 6.w,
          height: 6.w,
          decoration: ShapeDecoration(
            color: const Color(0xFF012356),
            shape: OvalBorder(),
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          text,
          style: TextStyle(
            color: const Color(0xFF012356),
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String bigValue, String smallValue) {
    return Container(
      width: 158.w,
      height: 79.h,
      padding: EdgeInsets.all(12.w),
      decoration: ShapeDecoration(
        color: const Color(0xFFFEFEFE),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: [
          BoxShadow(
            color: Color(0x28000000),
            blurRadius: 6,
            offset: Offset(0, 3),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: bigValue,
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (smallValue.isNotEmpty) ...[
                  TextSpan(
                    text: ' ',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  TextSpan(
                    text: smallValue,
                    style: TextStyle(
                      color: const Color(0x99012356), // Lower opacity match
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: ShapeDecoration(
          color: const Color(0xFFFEFEFE),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows: [
            BoxShadow(
              color: Color(0x28000000),
              blurRadius: 6,
              offset: Offset(0, 3),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: ShapeDecoration(
                color: const Color(0xFFF9F9F9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Icon(icon, color: Colors.black54, size: 20.sp),
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
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.sp,
              color: const Color(0xFF012356),
            ),
          ],
        ),
      ),
    );
  }
}
