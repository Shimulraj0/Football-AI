import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../controllers/module_cover_controller.dart';

class ModuleCoverView extends GetView<ModuleCoverController> {
  const ModuleCoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      title: 'Module Cover', // Corrected typo from "Moduel Cover"
      showBackButton: true,
      headerHeight: 124.h,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Module Cover',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Customize your digital appearance',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 16.h),
              _buildCoverImageCard(),
              SizedBox(height: 24.h),
              Text(
                'Subtitle',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              _buildTextField(
                controller: controller.subtitleController,
                hintText: 'Enter subtitle',
                suffixIcon: Container(
                  margin: EdgeInsets.all(10.w),
                  decoration: const BoxDecoration(
                    color: Color(0xFF0581EF),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.close, color: Colors.white, size: 14.sp),
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'Short Description',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              _buildTextField(
                controller: controller.descriptionController,
                hintText: 'Write short description',
                maxLines: 3,
                height: 70.h,
              ),
              SizedBox(height: 24.h),
              Text(
                'Created By',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              _buildTextField(
                controller: controller.createdByController,
                hintText: 'Created by: Name',
              ),
              SizedBox(height: 40.h),
              Center(child: _buildContinueButton()),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCoverImageCard() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 109.h,
          width: double.infinity,
          decoration: ShapeDecoration(
            image: const DecorationImage(
              image: AssetImage("assets/images/kick.png"),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFF0260ED)),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
              ),
            ),
          ),
        ),
        Container(
          width: 335.w,
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
                  image: const DecorationImage(
                    image: AssetImage("assets/images/kick.png"),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF0260ED)),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      bottomLeft: Radius.circular(8.r),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              SizedBox(
                width: 167.w,
                height: 19.h,
                child: Text(
                  'U12 Elite Ball Mastery',
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(right: 16.w),
                width: 24.w,
                height: 24.w,
                decoration: const BoxDecoration(
                  color: Color(0xFF0581EF),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check, color: Colors.white, size: 16.sp),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    Widget? suffixIcon,
    int maxLines = 1,
    double? height,
  }) {
    return Container(
      height: height ?? 40.h, // default height bit taller
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: maxLines > 1 ? 8.h : 0,
      ),
      alignment: maxLines == 1 ? Alignment.centerLeft : Alignment.topLeft,
      decoration: ShapeDecoration(
        color: Colors.white,
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
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        textAlignVertical: maxLines == 1
            ? TextAlignVertical.center
            : TextAlignVertical.top,
        style: TextStyle(
          color: const Color(0xFF012356),
          fontSize: 10.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: const Color(0x66012356),
            fontSize: 10.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 1.1,
          ),
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return GestureDetector(
      onTap: controller.onContinue,
      child: Container(
        width: 249.w,
        height: 39.h,
        decoration: ShapeDecoration(
          color: const Color(0xFF3064AB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          'Continue for Content',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
