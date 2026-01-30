import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../../../global_widgets/custom_back_button.dart';
import '../../../core/utils/size_utils.dart';

class CoachesOversightView extends GetView {
  const CoachesOversightView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFE8F3FF,
      ), // Light blue background from design
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Custom Header
            _buildHeader(),
            SizedBox(height: 20.h),

            // Content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Performance Section
                  Text(
                    'Performance',
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  _buildPerformanceCard(),
                  SizedBox(height: 24.h),

                  // Upcoming Evaluations Section
                  Text(
                    'Upcoming Evaluations',
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  _buildEvaluationsList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 50.h,
        bottom: 30.h,
        left: 20.w,
        right: 20.w,
      ),
      decoration: const ShapeDecoration(
        color: Color(0xFF012355),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x1E000000),
            blurRadius: 10.10,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Back Button (Aligned Left)
          Align(
            alignment: Alignment.centerLeft,
            child: CustomBackButton(
              onPressed: () => Get.back(),
              backgroundColor: const Color(0xFFE8F3FF),
              iconColor: const Color(0xFF012356),
            ),
          ),

          // Title (Centered)
          Text(
            'Coaches Oversight',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withValues(alpha: 0.10),
          ),
          borderRadius: BorderRadius.circular(8.w),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Above Expectations',
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Based on your score of 72%',
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 12.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12.h),
          // Progress Bar
          Container(
            height: 6.h,
            width: double.infinity,
            decoration: ShapeDecoration(
              color: const Color(0xFFE1E1E1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.72,
              child: Container(
                decoration: ShapeDecoration(
                  color: const Color(0xFF0260ED),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEvaluationsList() {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withValues(alpha: 0.20),
          ),
          borderRadius: BorderRadius.circular(8.w),
        ),
      ),
      child: Column(
        children: [
          _buildEvaluationItem(
            title: 'U10 Boys Silver',
            date: 'June 10',
            showBottomBorder: true,
          ),
          _buildEvaluationItem(
            title: 'U10 Boys Gold',
            date: 'June 15',
            showBottomBorder: false,
          ),
        ],
      ),
    );
  }

  Widget _buildEvaluationItem({
    required String title,
    required String date,
    bool showBottomBorder = true,
  }) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.evaluationDetails);
      },
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          border: showBottomBorder
              ? Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black.withValues(alpha: 0.10),
                  ),
                )
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  date,
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
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
}
