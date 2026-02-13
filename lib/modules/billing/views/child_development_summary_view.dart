import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../home/controllers/home_controller.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';

import '../../../../global_widgets/coach_floating_button.dart';

class ChildDevelopmentSummaryView extends StatelessWidget {
  const ChildDevelopmentSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      title: "Child Development Summary",
      // headerHeight: 120.h,
      // headerContent: _buildHeaderContent(),
      backgroundColor: const Color(0xFFF9F9F9),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildPlayerSummaryCard(),
                SizedBox(height: 24.h),
                Text(
                  'Upcoming Practices/Games',
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 16.h),
                _buildPracticeCard(),
                SizedBox(height: 16.h),
                _buildGameCard(),
                SizedBox(height: 80.h),
              ],
            ),
          ),
          const Positioned(right: 0, bottom: 0, child: CoachFloatingButton()),
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

  Widget _buildPlayerSummaryCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.black.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 46.w,
                height: 46.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/46x46"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tamim',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'U10 Boys Silver',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest Evaliation',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '65%',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 6.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFE1E1E1),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              Container(
                width: 188
                    .w, // Approx 65% of typical screen width, or utilize FractionallySizedBox
                height: 6.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF0260ED),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'Improving',
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 12.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Coach Says she is iproving her passing accuracy',
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 12.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPracticeCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.black.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Practice - Thursday',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 14.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '5:30 PM',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Field A',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8EFF6),
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    color: Colors.black.withValues(alpha: 0.2),
                    width: 0.5,
                  ),
                ),
                child: Text(
                  'Technical Session: Ball Control',
                  style: TextStyle(
                    color: const Color(0xCC012356),
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGameCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.black.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Game - Saturday',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 14.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '9:00 AM',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Stadium',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8EFF6),
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    color: Colors.black.withValues(alpha: 0.2),
                    width: 0.5,
                  ),
                ),
                child: Text(
                  'Home Game',
                  style: TextStyle(
                    color: const Color(0xCC012356),
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
