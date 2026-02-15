import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../../core/utils/size_utils.dart';
import '../controllers/clinics_controller.dart';

class ManageRegistrationView extends GetView<ClinicsController> {
  const ManageRegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      showBottomNav: true,
      title: "Manage Registration",
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            _buildSearchAndAddHeader(),
            SizedBox(height: 24.h),
            _buildRegistrationCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchAndAddHeader() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            height: 38.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: const Color(0x33012356)),
            ),
            child: Row(
              children: [
                Icon(Icons.search, size: 16.w, color: const Color(0x7F012356)),
                SizedBox(width: 8.w),
                Text(
                  'Search Players',
                  style: TextStyle(
                    color: const Color(0x7F012356),
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          flex: 4,
          child: Container(
            height: 38.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              color: const Color(0xFF1A56DB),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, size: 16.w, color: Colors.white),
                SizedBox(width: 4.w),
                Text(
                  'Add Registration',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegistrationCard() {
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
          _buildPlayerItem(
            "Marc B.",
            "U12",
            "Pending",
            const Color(0xFFCB6E00),
            const Color(0xFFF6E6D3),
          ),
          _buildPlayerItem(
            "James R.",
            "U10",
            "Paid",
            const Color(0xFF5DC281),
            const Color(0xFFC2ECD2),
          ),
          _buildPlayerItem(
            "Jason Myers",
            "U11",
            "Pending",
            const Color(0xFFCB6E00),
            const Color(0xFFF6E6D3),
          ),
          _buildPlayerItem(
            "Mia R.",
            "U9",
            "Unpaid",
            const Color(0xFFDD2E34),
            const Color(0xFFFFDADB),
            isLast: true,
          ),
          SizedBox(height: 24.h),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.edit_outlined, color: Colors.white, size: 20.w),
              label: Text(
                'Send Invites',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3064AB),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
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
        _buildStatText("28", " Registration", const Color(0xFF0CCF4D)),
        Text(
          "|",
          style: TextStyle(color: const Color(0x33012356), fontSize: 14.sp),
        ),
        _buildStatText("3", " Pending", const Color(0xFFFF9D60)),
        Text(
          "|",
          style: TextStyle(color: const Color(0x33012356), fontSize: 14.sp),
        ),
        _buildStatText("25", " Confirmed", const Color(0xFF0260ED)),
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

  Widget _buildPlayerItem(
    String name,
    String team,
    String status,
    Color textColor,
    Color bgColor, {
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
