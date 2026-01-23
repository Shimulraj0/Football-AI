import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../controllers/ai_assistant_controller.dart';

class AiAssistantView extends GetView<AiAssistantController> {
  const AiAssistantView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      title: 'AI Assistant',
      showBackButton: true,
      headerHeight: 127.h,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Module AI Assistant',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Manage downloadable PDFs',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 24.h),
              _buildUploadButton(),
              SizedBox(height: 40.h),
              _buildDraftItem(
                title: 'Draft 6 week ago plan for U10s',
                onTap: controller.onDraftItemClicked,
              ),
              SizedBox(height: 16.h),
              _buildGenerateItem(
                title: 'Generate PDF session plan',
                onTap: controller.onGeneratePdfClicked,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUploadButton() {
    return Container(
      width: 335.w,
      height: 134.h,
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
      child: Center(
        child: Container(
          width: 303.w,
          height: 102.h,
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFF0260ED)),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: ElevatedButton(
            onPressed: controller.onUploadNewFile,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0581EF),
              padding: EdgeInsets.all(8.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add, color: Colors.white, size: 24.sp),
                SizedBox(width: 4.w),
                Text(
                  'Upload New File',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDraftItem({required String title, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 335.w,
        height: 78.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
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
              width: 48.w,
              height: 48.w,
              decoration: ShapeDecoration(
                color: const Color(0xFFF9F9F9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.refresh,
                  color: const Color(0xFF575757),
                  size: 24.sp,
                ), // Changed icon to match "Draft" context vaguely, user snippet showed icon in box
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              'Draft',
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
      ),
    );
  }

  Widget _buildGenerateItem({required String title, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 335.w,
        height: 78.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
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
              width: 48.w,
              height: 48.w,
              decoration: ShapeDecoration(
                color: const Color(0xFFF9F9F9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.picture_as_pdf,
                  color: const Color(0xFF575757),
                  size: 24.sp,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(
              Icons.auto_awesome,
              color: const Color(0xFF575757),
              size: 24.sp,
            ),
          ],
        ),
      ),
    );
  }
}
