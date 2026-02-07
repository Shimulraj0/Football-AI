import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../controllers/manual_builder_controller.dart';

class ManualBuilderView extends GetView<ManualBuilderController> {
  const ManualBuilderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      title: 'Manual Builder',
      showBackButton: true,
      headerHeight: 124.h,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Module Foundations',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              _buildTextField(
                controller: controller.drillsController,
                hintText: 'Write your own drills',
              ),
              SizedBox(height: 24.h),

              Text(
                'Videos',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              _buildTextField(
                controller: controller.videosController,
                hintText: 'Add Videos',
                suffixIcon: Icon(
                  Icons.link,
                  color: const Color(0xFF575757),
                  size: 24.sp,
                ),
              ),
              SizedBox(height: 24.h),

              Text(
                'Playing Structure',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              _buildTextField(
                controller: controller.playingStructureController,
                hintText: 'Write playing structure',
                maxLines: 3,
                height: 70.h,
              ),
              SizedBox(height: 40.h),

              Center(child: _buildSaveButton()),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
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
      height: height ?? 40.h,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: maxLines > 1 ? 8.h : 0,
      ),
      // Align center left for single line, top left for multiline
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
        decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: const Color(0x66012356),
            fontSize: 12.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 1.1,
          ),
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets
              .zero, // Remove default padding to let container handle it
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return GestureDetector(
      onTap: controller.onSaveAndContinue,
      child: Container(
        width: 249.w,
        height: 44.h,
        decoration: ShapeDecoration(
          color: const Color(0xFF3064AB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          'Save & Continue',
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
