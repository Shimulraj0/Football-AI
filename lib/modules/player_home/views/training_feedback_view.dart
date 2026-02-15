import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../../global_widgets/custom_back_button.dart';
import '../../../core/utils/size_utils.dart';
import '../controllers/training_feedback_controller.dart';

class TrainingFeedbackView extends GetView<TrainingFeedbackController> {
  const TrainingFeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      showHeader: true,
      headerHeight: 180.h,
      headerContent: Container(
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 24.h, left: 20.w, right: 20.w),
        decoration: ShapeDecoration(
          color: const Color(0xFF012355),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32.r),
              bottomRight: Radius.circular(32.r),
            ),
          ),
          shadows: [
            BoxShadow(
              color: const Color(0x1E000000),
              blurRadius: 10.10.r,
              offset: Offset(0, 4.h),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomBackButton(
                  onPressed: () => Get.back(),
                  backgroundColor: Colors.white,
                  iconColor: const Color(0xFF012355),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              'Training Feedback',
              style: TextStyle(
                color: const Color(0xFFFEFEFE),
                fontSize: 24.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Reflect on today's training session",
              style: TextStyle(
                color: const Color(0xFFFEFEFE).withValues(alpha: 0.8),
                fontSize: 14.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: ShapeDecoration(
                color: const Color(0xFFFEFEFE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                shadows: [
                  BoxShadow(
                    color: const Color(0x14000000),
                    blurRadius: 19.80.r,
                    offset: Offset(0, 4.h),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 311.w,
                          child: Text(
                            'How did you feel about your passing today?',
                            style: TextStyle(
                              color: const Color(0xFF374151),
                              fontSize: 14.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 11.h),
                        TextField(
                          controller: controller.passingController,
                          maxLines: 3,
                          style: TextStyle(
                            color: const Color(0xFF575757),
                            fontSize: 12.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            hintText:
                                'I felt confident with short passes but struggled with long balls...',
                            hintStyle: TextStyle(
                              color: const Color(
                                0xFF575757,
                              ).withValues(alpha: 0.5),
                              fontSize: 12.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                            contentPadding: EdgeInsets.all(10.w),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xFFE0E0E0),
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xFF012355),
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 23.h),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSliderSection(
                          "Rate your focus level (1-10): ",
                          controller.focusLevel,
                          "Low Focus",
                          "High Focus",
                        ),
                        SizedBox(height: 15.h),
                        _buildSliderSection(
                          "Rate your energy level (1-10): ",
                          controller.energyLevel,
                          "Low Energy",
                          "High Energy",
                        ),
                        SizedBox(height: 15.h),
                        _buildSliderSection(
                          "Rate your confidence level (1-10): ",
                          controller.confidenceLevel,
                          "Low Confidence",
                          "High Confidence",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 23.h),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 311.w,
                          child: Text(
                            'Additional notes (optional)',
                            style: TextStyle(
                              color: const Color(0xFF374151),
                              fontSize: 14.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 11.h),
                        TextField(
                          controller: controller.notesController,
                          maxLines: 3,
                          style: TextStyle(
                            color: const Color(0xFF575757),
                            fontSize: 12.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            hintText:
                                'Any other thoughts about today\'s session...',
                            hintStyle: TextStyle(
                              color: const Color(
                                0xFF575757,
                              ).withValues(alpha: 0.5),
                              fontSize: 12.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                            contentPadding: EdgeInsets.all(10.w),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xFFE0E0E0),
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xFF012355),
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliderSection(
    String label,
    RxDouble value,
    String lowLabel,
    String highLabel,
  ) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: const Color(0xFF202020),
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Obx(
                    () => Text(
                      value.value.toInt().toString(),
                      style: TextStyle(
                        color: const Color(0xFF202020),
                        fontSize: 12.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Obx(
            () => SliderTheme(
              data: SliderTheme.of(Get.context!).copyWith(
                activeTrackColor: const Color(0xFF012355),
                inactiveTrackColor: const Color(0xFFE0E0E0),
                thumbColor: const Color(0xFF012355),
                overlayColor: const Color(0xFF012355).withValues(alpha: 0.1),
                trackHeight: 2.0,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 6.0,
                ),
              ),
              child: Slider(
                value: value.value,
                min: 1,
                max: 10,
                divisions: 9,
                onChanged: (val) {
                  value.value = val;
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                lowLabel,
                style: TextStyle(
                  color: const Color(0xFF575757),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                highLabel,
                style: TextStyle(
                  color: const Color(0xFF575757),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
