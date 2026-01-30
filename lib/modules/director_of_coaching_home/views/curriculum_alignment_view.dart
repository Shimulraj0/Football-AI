import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/custom_back_button.dart';
import '../../../core/utils/size_utils.dart';

class CurriculumAlignmentView extends GetView {
  const CurriculumAlignmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFE),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStandardOverviewCard(),
                  SizedBox(
                    height: 24.h,
                  ), // Spacing from snippet "spacing: 16" in outer column? Adjusted for visual balance.

                  _buildSectionTitle('Standard Overview'),
                  SizedBox(height: 16.h),
                  _buildSectionTitle('Learning Objective Mapping'),
                  SizedBox(height: 16.h),
                  _buildObjectiveMappingCard(),

                  SizedBox(height: 24.h),
                  _buildSectionTitle('Skills Alignment'),
                  SizedBox(height: 16.h),
                  _buildSkillsAlignmentRow(),

                  SizedBox(height: 24.h),
                  _buildSectionTitle('Progress Against Standards'),
                  SizedBox(height: 16.h),
                  _buildProgressBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        title,
        style: TextStyle(
          color: const Color(0xFF012356),
          fontSize: 16.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 50.h,
        bottom: 30.h,
        left: 20.w,
        right: 20.w,
      ),
      decoration: const ShapeDecoration(
        color: Color(0xFF012355),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x1E000000),
            blurRadius: 10.10,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CustomBackButton(
              onPressed: () => Get.back(),
              backgroundColor: const Color(0xFFE8F3FF),
              iconColor: const Color(0xFF012356),
            ),
          ),
          Text(
            'Curriculum Alignment',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStandardOverviewCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.w),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.w)),
        shadows: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 103.w,
                child: Text(
                  'Performance',
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                width: 68.w,
                child: Text(
                  'Grade 5',
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            'Eng- 4.3',
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildObjectiveMappingCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8.w),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.w)),
        shadows: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildObjectiveItem(
            'Analyze how content is organized in different genres',
          ),
          SizedBox(height: 16.h),
          _buildObjectiveItem('Explain how a text structures an argument'),
          SizedBox(height: 16.h),
          _buildObjectiveItem(
            'Identify the to-level idea and supporting details in a text',
          ),
        ],
      ),
    );
  }

  Widget _buildObjectiveItem(String text) {
    return Text(
      text,
      style: TextStyle(
        color: const Color(0xFF012356),
        fontSize: 12.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildSkillsAlignmentRow() {
    return Wrap(
      spacing: 12.w,
      runSpacing: 12.h,
      children: [
        _buildSkillChip('Reading'),
        _buildSkillChip('Critical Thinking'),
        _buildSkillChip('Collaboration'),
      ],
    );
  }

  Widget _buildSkillChip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: ShapeDecoration(
        color: const Color(0xFFF4F6F8),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.20,
            color: Colors.black.withValues(alpha: 0.20),
          ),
          borderRadius: BorderRadius.circular(4.w),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: const Color(0xFF012356).withValues(alpha: 0.8),
          fontSize: 12.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Stack(
          children: [
            Container(
              height: 6.h,
              width: double.infinity,
              decoration: ShapeDecoration(
                color: const Color(0xFFE1E1E1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.w),
                ),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.65,
              child: Container(
                height: 6.h,
                decoration: ShapeDecoration(
                  color: const Color(0xFF0260ED),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.w),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          '65%',
          style: TextStyle(
            color: const Color(0xFF012356).withValues(alpha: 0.8),
            fontSize: 12.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
