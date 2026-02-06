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
      backgroundColor: const Color(0xFFEDF5FF),
      body: SafeArea(
        child: SingleChildScrollView(
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
      ),
    );
  }

  Widget _buildLogoSection() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              color: const Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: const Color(0xFF0260ED).withOpacity(0.3),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.camera_alt_outlined,
                color: const Color(0xFF012355),
                size: 24.w,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Club Logo",
                style: TextStyle(
                  color: const Color(0xFF012355),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "Edit logo",
                style: TextStyle(
                  color: const Color(0xFF012355),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter',
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ],
      ),
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
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: const Color(0xFF012355).withOpacity(0.4),
                  fontSize: 14.sp,
                  fontFamily: 'Inter',
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 14.h,
                ),
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
      width: double.infinity,
      height: 48.h,
      decoration: BoxDecoration(
        color: const Color(0xFF3064AB),
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0x3D3064AB),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
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
