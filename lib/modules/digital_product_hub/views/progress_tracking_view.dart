import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../controllers/progress_tracking_controller.dart';

class ProgressTrackingView extends GetView<ProgressTrackingController> {
  const ProgressTrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      title: 'Progress Tracking',
      showBackButton: true,
      headerHeight: 127.h,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'U12 Elite Ball Mastery',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16.h),
              _buildCompletionStatsCard(),
              SizedBox(height: 32.h),
              Text(
                'User Milestones',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16.h),
              _buildUserMilestoneItem(
                name: 'Ethan J.',
                progress: 1.0, // Fully complete looking bar
              ),
              SizedBox(height: 12.h),
              _buildUserMilestoneItem(
                name: 'Thomas J.',
                progress: 0.35, // Partial bar
              ),
              SizedBox(height: 32.h),
              _buildWeeklyEngagementCard(),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompletionStatsCard() {
    return Container(
      width: 335.w,
      height: 143.h,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Circular Progress
          SizedBox(
            width: 102.w,
            height: 102.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Background circle
                Container(
                  width: 102.w,
                  height: 102.w,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF0F4FD),
                    shape: OvalBorder(
                      side: BorderSide(
                        width: 4.w,
                        color: const Color(0xFFF0F4FD), // Or light blue
                      ),
                    ),
                  ),
                ),
                // Foreground circle (simulation)
                // Integrating a proper circular progress is better, but following snippet structure:
                SizedBox(
                  width: 102.w,
                  height: 102.w,
                  child: CircularProgressIndicator(
                    value: 0.78,
                    strokeWidth: 4.w,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xFF0382F0),
                    ),
                    backgroundColor: const Color(0xFFF0F4FD),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '78%',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF012356),
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Completion\nRate',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF012356),
                        fontSize: 12.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Stats Column
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStatBox(value: '247', label: 'Total Users'),
              SizedBox(height: 12.h),
              _buildStatBox(value: '15,800', label: 'Engagements'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatBox({required String value, required String label}) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
      decoration: ShapeDecoration(
        color: const Color(0xFFF8F8F8),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withValues(alpha: 0.10),
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: const Color(0x99012356),
              fontSize: 12.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserMilestoneItem({
    required String name,
    required double progress,
  }) {
    return Container(
      width: 335.w,
      padding: EdgeInsets.all(16.w),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36.w,
                height: 36.w,
                decoration: const ShapeDecoration(
                  color: Color(0xFFC4C4C4), // Placeholder color
                  shape: OvalBorder(),
                ),
                // In real app use NetworkImage or Asset
                child: Icon(Icons.person, color: Colors.white, size: 20.sp),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: const Color(0xFF012356),
                size: 24.sp,
              ),
            ],
          ),
          if (progress < 1.0) ...[
            SizedBox(height: 12.h),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5E7EB),
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: progress,
                  child: Container(
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFF536EBA),
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildWeeklyEngagementCard() {
    return Container(
      width: 335.w,
      padding: EdgeInsets.all(16.w),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weekly Engagement',
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 100.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildBar(height: 35),
                _buildBar(height: 48),
                _buildBar(
                  height: 71,
                  color: const Color(0xFF0F5CCF),
                ), // Slightly different blue
                _buildBar(height: 83, color: const Color(0xFF178AF2)),
                _buildBar(height: 76, color: const Color(0xFF0F5CCF)),
                _buildBar(height: 93, color: const Color(0xFF178AF2)),
                _buildBar(height: 80, color: const Color(0xFF178AF2)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBar({required double height, Color? color}) {
    return Container(
      width: 27.w,
      height: height.h,
      decoration: BoxDecoration(
        color: color ?? const Color(0xFF012356),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4.r),
          topRight: Radius.circular(4.r),
        ),
      ),
    );
  }
}
