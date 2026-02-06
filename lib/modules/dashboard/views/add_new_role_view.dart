import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../core/utils/size_utils.dart';
import '../controllers/dashboard_controller.dart';

class AddNewRoleView extends GetView<DashboardController> {
  const AddNewRoleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Add New Role',
      showBottomNav: true,
      backgroundColor: const Color(0xFFEEF5FF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfilePictureSection(),
                  SizedBox(height: 20.h),
                  _buildLabel('Role Title'),
                  SizedBox(height: 8.h),
                  _buildTextField(hintText: 'Write role title'),
                  SizedBox(height: 20.h),
                  _buildLabel('Select Department'),
                  SizedBox(height: 8.h),
                  _buildDropdownField(hintText: 'select department'),
                  SizedBox(height: 20.h),
                  _buildLabel('Primary Contact'),
                  SizedBox(height: 8.h),
                  _buildTextField(hintText: 'write primary contact'),
                  SizedBox(height: 20.h),
                  _buildLabel('User Assignment'),
                  SizedBox(height: 8.h),
                  _buildTextField(
                    hintText: 'Assign member via email',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFF012356).withOpacity(0.4),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  _buildLabel('Permission Level'),
                  SizedBox(height: 12.h),
                  _buildPermissionLevelSection(),
                  SizedBox(height: 40.h),
                  _buildCreateRoleButton(),
                  SizedBox(height: 100.h), // Bottom padding
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePictureSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: ShapeDecoration(
        color: const Color(0xFFFEFEFE),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        shadows: const [
          BoxShadow(
            color: Color(0x28000000),
            blurRadius: 6,
            offset: Offset(0, 3),
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
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Icon(
              Icons.camera_alt_outlined,
              color: const Color(0xFF012356),
              size: 30.w,
            ),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profile Picture',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Edit Picture',
                style: TextStyle(
                  color: const Color(0xFF012356),
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
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        color: const Color(0xFF012356),
        fontSize: 16.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildTextField({required String hintText, Widget? prefixIcon}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        shadows: const [
          BoxShadow(
            color: Color(0x28000000),
            blurRadius: 6,
            offset: Offset(0, 3),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: const Color(0x66012356),
            fontSize: 14.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }

  Widget _buildDropdownField({required String hintText}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        shadows: const [
          BoxShadow(
            color: Color(0x28000000),
            blurRadius: 6,
            offset: Offset(0, 3),
            spreadRadius: 0,
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(
            hintText,
            style: TextStyle(
              color: const Color(0x66012356),
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: const Color(0xFF012356).withOpacity(0.4),
          ),
          dropdownColor: Colors.white,
          elevation: 2,
          padding: EdgeInsets.zero,
          items: ['Executive', 'Technical', 'Admin'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(6.w),
                decoration: value == 'Admin'
                    ? const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Color(0x33012356),
                          ),
                          left: BorderSide.none,
                          right: BorderSide.none,
                          top: BorderSide.none,
                        ),
                      )
                    : ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: const Color(0x33012356),
                          ),
                        ),
                      ),
                child: Text(
                  value,
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {},
        ),
      ),
    );
  }

  Widget _buildPermissionLevelSection() {
    return Row(
      children: [
        _buildPermissionToggle('View Only', true),
        SizedBox(width: 24.w),
        _buildPermissionToggle('Admin', true),
      ],
    );
  }

  Widget _buildPermissionToggle(String label, bool value) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            color: const Color(0xFF012356),
            fontSize: 14.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 8.w),
        // Simple Switch for now, needing custom styling to match design exactly if needed
        // Design shows a blue switch with white circular thumb
        SizedBox(
          height: 24.h,
          width: 40.w,
          child: Switch(
            value: value,
            activeColor: Colors.white,
            activeTrackColor: const Color(0xFF0260ED),
            onChanged: (val) {},
          ),
        ),
      ],
    );
  }

  Widget _buildCreateRoleButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        color: const Color(0xFF3064AB),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      child: Text(
        'Create Role',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
