import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../../core/utils/size_utils.dart';
import '../controllers/clinics_controller.dart';

class CurriculumBuilderView extends GetView<ClinicsController> {
  const CurriculumBuilderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      showBottomNav: true,
      title: "Curriculum Builder",
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            _buildClinicInfoCard(),
            SizedBox(height: 16.h),
            _buildCurriculumMainCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildClinicInfoCard() {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Summer Soccer Skill Camp",
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                ),
              ),
              Icon(
                Icons.edit_outlined,
                color: const Color(0xFF012356),
                size: 20.w,
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            "Event Creation & Details",
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 12.h),
          const Divider(color: Color(0xFFE0E0E0), height: 1),
          SizedBox(height: 12.h),
          Text(
            "Intensive training camp focusing on technical skills, agility & conditioning",
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurriculumMainCard() {
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
          Text(
            "Ball Control & Dribbling",
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Text(
                "2 Session",
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter',
                ),
              ),
              Text(
                " | ",
                style: TextStyle(
                  color: const Color(0x33012356),
                  fontSize: 12.sp,
                ),
              ),
              Text(
                "60 mins",
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          const Divider(color: Color(0xFFE0E0E0), height: 1),
          SizedBox(height: 16.h),
          _buildCheckItem("Dribbling with both feet", true),
          _buildCheckItem("Basic ball control under pressure", true),
          SizedBox(height: 8.h),
          _buildAddSessionsButton(),
          SizedBox(height: 16.h),
          const Divider(color: Color(0xFFE0E0E0), height: 1),
          SizedBox(height: 16.h),
          Text(
            "This Week",
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 12.h),
          _buildExpandableItem(
            title: "Ball Control & Dribbling",
            subtitle: "2 Session | 60 mins",
            imageUrl: "assets/icons/Ellipse13.png",
          ),
          _buildExpandableItem(
            title: "James R.",
            subtitle: "U12 Boys Premier",
            imageUrl: "assets/icons/Ellipse13.png",
          ),
          _buildExpandableItem(
            title: "Jason Myers",
            subtitle: "Asst. Coach",
            imageUrl: "assets/icons/Ellipse13.png",
            isLast: true,
          ),
          SizedBox(height: 24.h),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, color: Colors.white),
              label: Text(
                "Add Curriculum",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
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

  Widget _buildCheckItem(String text, bool isChecked) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Container(
            width: 18.w,
            height: 18.w,
            decoration: BoxDecoration(
              color: isChecked ? const Color(0xFF0955C8) : Colors.transparent,
              border: Border.all(
                color: isChecked ? const Color(0xFF0955C8) : Colors.grey,
                width: 2.w,
              ),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: isChecked
                ? Icon(Icons.check, color: Colors.white, size: 14.w)
                : null,
          ),
          SizedBox(width: 8.w),
          Text(
            text,
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddSessionsButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: const Color(0xFFE7ECF7),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add, color: const Color(0xFF012356), size: 16.w),
          SizedBox(width: 4.w),
          Text(
            "Add Sessions",
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableItem({
    required String title,
    required String subtitle,
    required String imageUrl,
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
          CircleAvatar(radius: 17.r, backgroundImage: AssetImage(imageUrl)),
          SizedBox(width: 8.w),
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
                    fontFamily: 'Inter',
                    height: 1.1,
                  ),
                ),
                Text(
                  subtitle,
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
          Icon(
            Icons.keyboard_arrow_down,
            color: const Color(0xFF012356),
            size: 24.w,
          ),
        ],
      ),
    );
  }
}
