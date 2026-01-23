import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../controllers/module_tools_controller.dart';

class ModuleToolsView extends GetView<ModuleToolsController> {
  const ModuleToolsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      title: 'Tools',
      showBackButton: true,
      headerHeight: 127.h,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Module Tools',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Manage downloadable resources for this module',
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
              Obx(
                () => _buildToolItem(
                  title: 'U12 Scanning Checklist',
                  icon: Icons.checklist_rtl,
                  value: controller.u12ScanningChecklist.value,
                  onChanged: controller.toggleU12ScanningChecklist,
                ),
              ),
              SizedBox(height: 16.h),
              Obx(
                () => _buildToolItem(
                  title: 'Full Practice Plan',
                  icon: Icons.calendar_today,
                  value: controller.fullPracticePlan.value,
                  onChanged: controller.toggleFullPracticePlan,
                ),
              ),
              SizedBox(height: 16.h),
              Obx(
                () => _buildToolItem(
                  title: 'Defensive Shape Drill',
                  icon: Icons.calendar_today,
                  value: controller.defensiveShapeDrill.value,
                  onChanged: controller.toggleDefensiveShapeDrill,
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUploadButton() {
    return GestureDetector(
      onTap: controller.onUploadNewFile,
      child: Container(
        width: 335.w,
        height: 134.h,
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
        child: Center(
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
        ),
      ),
    );
  }

  Widget _buildToolItem({
    required String title,
    required IconData icon,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      width: 335.w,
      height: 78.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
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
            child: Icon(icon, color: const Color(0xFF575757), size: 24.sp),
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
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Colors.white,
            activeTrackColor: const Color(0xFF30C360),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}
