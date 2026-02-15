import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../../core/utils/size_utils.dart';
import '../controllers/clinics_controller.dart';

class AttendanceTrackerView extends GetView<ClinicsController> {
  const AttendanceTrackerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      showBottomNav: true,
      title: "Attendance Tracker",
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(children: [_buildAttendanceCard()]),
      ),
    );
  }

  Widget _buildAttendanceCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 6.r,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatsSummary(),
          SizedBox(height: 16.h),
          const Divider(color: Color(0xFFE0E0E0), height: 1),
          SizedBox(height: 16.h),
          Text(
            'This Week',
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 12.h),
          _buildAttendanceItem(
            "Marc B.",
            "U12",
            "Pending",
            const Color(0xFFCB6E00),
            const Color(0xFFF6E6D3),
            isChecked: false,
          ),
          _buildAttendanceItem(
            "James R.",
            "U10",
            "Present",
            const Color(0xFF5DC281),
            const Color(0xFFC2ECD2),
            isChecked: true,
          ),
          _buildAttendanceItem(
            "Jason Myers",
            "U11",
            "Pending",
            const Color(0xFFCB6E00),
            const Color(0xFFF6E6D3),
            isChecked: false,
          ),
          _buildAttendanceItem(
            "Mia R.",
            "U9",
            "Absent",
            const Color(0xFFDD2E34),
            const Color(0xFFFFDADB),
            isChecked: true,
            isLast: true,
          ),
          SizedBox(height: 24.h),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: const Color(0xFF3064AB),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Select Presents',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 24.w,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSummary() {
    return Wrap(
      spacing: 8.w,
      children: [
        _buildStatText("28", " Present", const Color(0xFF0CCF4D)),
        Text(
          "|",
          style: TextStyle(color: const Color(0x33012356), fontSize: 14.sp),
        ),
        _buildStatText("3", " Pending", const Color(0xFFFF9D60)),
        Text(
          "|",
          style: TextStyle(color: const Color(0x33012356), fontSize: 14.sp),
        ),
        _buildStatText("25", " Absent", const Color(0xFFDD2E34)),
      ],
    );
  }

  Widget _buildStatText(String count, String label, Color countColor) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: count,
            style: TextStyle(
              color: countColor,
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: label,
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceItem(
    String name,
    String team,
    String status,
    Color textColor,
    Color bgColor, {
    required bool isChecked,
    bool isLast = false,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isLast ? Colors.transparent : const Color(0x33012356),
            width: isLast ? 0 : 1.w,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 18.w,
            height: 18.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: isChecked
                    ? const Color(0xFF1A56DB)
                    : const Color(0xFFD1D5DB),
                width: 1.5.w,
              ),
              borderRadius: BorderRadius.circular(4.r),
              color: isChecked ? const Color(0xFF1A56DB) : Colors.transparent,
            ),
            child: isChecked
                ? Icon(Icons.check, size: 14.w, color: Colors.white)
                : null,
          ),
          SizedBox(width: 8.w),
          CircleAvatar(
            radius: 17.r,
            backgroundImage: const AssetImage('assets/icons/Ellipse13.png'),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                    height: 1.1,
                  ),
                ),
                Text(
                  team,
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: textColor,
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
}
