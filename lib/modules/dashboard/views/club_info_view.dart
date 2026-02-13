import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../core/utils/size_utils.dart';

class ClubInfoView extends StatelessWidget {
  const ClubInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure we are in the right navigation context if using global bottom nav
    // But typically for a deep form view, we might not need to force the route update
    // unless we want the bottom nav to highlight something specific.
    // For now, we'll leave it as a detail page.

    return BaseScaffold(
      title: "Club Info",
      showBackButton: true,
      showHeader: true,
      showBottomNav: true,
      backButtonBackgroundColor: const Color(0xFFE8F3FF),
      backButtonIconColor: const Color(0xFF012355),
      backgroundColor: const Color(0xFFEDF5FF),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLogoSection(),
            SizedBox(height: 24.h),
            _buildTextField("Club Name", "write club name"),
            _buildTextField("Year Founded", "write founded year"),
            _buildTextField("Primary Contact", "write primary contact"),
            _buildTextField("Email Address", "write email address"),
            _buildTextField("Phone Number", "write phone number"),
            _buildTextField("Website", "Give website link"),
            _buildTextField("Home Ground", "Write home ground"),
            SizedBox(height: 32.h),
            Center(child: _buildUpdateButton()),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 88.h,
          decoration: ShapeDecoration(
            color: const Color(0xFFFEFEFE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
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
            children: [
              Container(
                width: 82.w,
                height: 88.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF0260ED)),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      bottomLeft: Radius.circular(8.r),
                    ),
                  ),
                ),
                child: Center(
                  child: SizedBox(
                    width: 24.w,
                    height: 24.w,
                    // Placeholder for camera icon or image
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: const Color(0xFF012355),
                      size: 24.w,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Club Logo',
                    style: TextStyle(
                      color: const Color(0xFF012355),
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Edit logo',
                    style: TextStyle(
                      color: const Color(0xFF012355),
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: const Color(0xFF012355),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              shadows: [
                BoxShadow(
                  color: const Color(0x28000000),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: const Color(0x66012356),
                  fontSize: 14.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.10,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
                isDense: true,
              ),
              style: TextStyle(
                color: const Color(0xFF012355),
                fontSize: 14.sp,
                fontFamily: 'Inter',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpdateButton() {
    return Container(
      width: 240.w,
      height: 44.h, // Adjusted based on standard button height in design
      decoration: BoxDecoration(
        color: const Color(0xFF3064AB),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Update action
            Get.back();
            Get.snackbar("Success", "Club Info Updated");
          },
          borderRadius: BorderRadius.circular(8.r),
          child: Center(
            child: Text(
              "Update Profile",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
