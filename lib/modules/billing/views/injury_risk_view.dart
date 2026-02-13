import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../global_widgets/custom_back_button.dart';

import '../../../../global_widgets/coach_floating_button.dart';

class InjuryRiskView extends StatelessWidget {
  const InjuryRiskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      headerHeight: 124.h,
      headerContent: _buildHeaderContent(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  _buildBanner(),
                  SizedBox(height: 32.h),
                  _buildFeatureItem(
                    title: 'Predict Overuse Injuries',
                    description:
                        'AI analyzes player load and flags high risk for strains.', // Corrected from snippet "AI analyacs player call..."
                    icon: Icons.health_and_safety_outlined,
                  ),
                  SizedBox(height: 16.h),
                  _buildFeatureItem(
                    title: 'Adjust Weekly Workload',
                    description:
                        'Monitor exertion levels and suggest deload days.', // Corrected from snippet "Monitor examinor levels..."
                    icon: Icons.calendar_month_outlined,
                  ),
                  SizedBox(height: 32.h),
                  _buildUpgradeButton(),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
          const Positioned(right: 0, bottom: 0, child: CoachFloatingButton()),
        ],
      ),
    );
  }

  Widget _buildHeaderContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          CustomBackButton(
            onPressed: () => Get.back(),
            backgroundColor: Colors.white,
            iconColor: const Color(0xFF00204A),
          ),
          Center(
            child: Text(
              'Injury Risk AI Alerts',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.04, -0.00),
          end: Alignment(1.15, 1.49),
          colors: [Color(0xFF162657), Color(0xFFCDD8FA)],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        shadows: [
          BoxShadow(
            color: const Color(0x28000000),
            blurRadius: 6,
            offset: const Offset(0, 3),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Injury Risk AI Alerts',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: ShapeDecoration(
                  color: const Color(0xFFF6E6D3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                child: Text(
                  'Early Access',
                  style: TextStyle(
                    color: const Color(0xFFCB6E00),
                    fontSize: 10.sp, // Slightly smaller for badge
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            'Prevent Overuse & Monitor RPE Trends',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Receive predictive alerts when players are at risk for injury due to high load of fatigue.', // Corrected typo "fatigus"
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem({
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Container(
      width: 335.w,
      height: 88.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: ShapeDecoration(
        color: const Color(0xFFFEFEFE),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        shadows: [
          BoxShadow(
            color: const Color(0x28000000),
            blurRadius: 6,
            offset: const Offset(0, 3),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            decoration: ShapeDecoration(
              color: const Color(0xFFF9F9F9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Center(
              child: SizedBox(
                width: 24.w,
                height: 24.w,
                child: Icon(icon, color: const Color(0xFF000000), size: 20.sp),
              ),
            ),
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
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  description,
                  style: TextStyle(
                    color: const Color(0x99012356),
                    fontSize: 11.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpgradeButton() {
    return Center(
      child: SizedBox(
        width: 209.w,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3064AB),
            padding: EdgeInsets.symmetric(vertical: 10.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            'Upgrade Now',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
