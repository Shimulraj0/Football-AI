import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../home/controllers/home_controller.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';

class ChildDevelopmentSummaryView extends StatelessWidget {
  const ChildDevelopmentSummaryView({super.key});

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
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 32.w,
              height: 32.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.arrow_back, color: Colors.black, size: 20.sp),
            ),
          ),
          SizedBox(width: 16.w),
          Text(
            'Child Development Summary',
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
