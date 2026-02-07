import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../controllers/ai_rules_controller.dart';

class AiRulesView extends GetView<AiRulesController> {
  const AiRulesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      title: 'AI Rules',
      showBackButton: true,
      headerHeight: 124.h,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Personality & Tone'),
              SizedBox(height: 16.h),
              _buildToneCard(),
              SizedBox(height: 32.h),
              _buildSectionTitle('Safety & Content Restrictions'),
              SizedBox(height: 16.h),
              _buildRestrictionsCard(),
              SizedBox(height: 32.h),
              _buildSectionTitle('AI Prompt Mastery'),
              SizedBox(height: 16.h),
              _buildPromptMasteryCard(),
              SizedBox(height: 40.h),
              Row(
                children: [
                  Expanded(child: _buildResetButton()),
                  SizedBox(width: 16.w),
                  Expanded(child: _buildUpdateButton()),
                ],
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: const Color(0xFF012356),
        fontSize: 16.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildToneCard() {
    return Container(
      width: 335.w,
      padding: EdgeInsets.all(16.w),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tone',
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Obx(
                    () => Text(
                      controller.selectedTone.value,
                      style: TextStyle(
                        color: const Color(0xFF012356),
                        fontSize: 12.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => Switch(
                  value: controller.toneEnabled.value,
                  onChanged: controller.toggleToneEnabled,
                  activeThumbColor: const Color(0xFF30C360),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),
          SizedBox(height: 12.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: controller.availableTones.map((tone) {
              return Obx(() {
                final isSelected = controller.selectedTone.value == tone;
                return GestureDetector(
                  onTap: () => controller.selectTone(tone),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF0982E8)
                          : const Color(0xFFF0F2F1),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      tone,
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF012356),
                        fontSize: 12.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                );
              });
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildRestrictionsCard() {
    return Container(
      width: 335.w,
      padding: EdgeInsets.all(16.w),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Restricted Topics',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Obx(
                () => Switch(
                  value: controller.restrictionsEnabled.value,
                  onChanged: controller.toggleRestrictionsEnabled,
                  activeThumbColor: const Color(0xFF30C360),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),
          SizedBox(height: 12.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: controller.availableRestrictions.map((topic) {
              return Obx(() {
                final isSelected = controller.restrictedTopics.contains(topic);
                return GestureDetector(
                  onTap: () => controller.toggleRestriction(topic),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF0982E8)
                          : const Color(0xFFF0F2F1),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      topic,
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF012356),
                        fontSize: 12.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                );
              });
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPromptMasteryCard() {
    return Container(
      width: 335.w,
      padding: EdgeInsets.all(16.w),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'U8 (Advanced)',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Obx(
                () => Switch(
                  value: controller.promptMasteryEnabled.value,
                  onChanged: controller.togglePromptMasteryEnabled,
                  activeThumbColor: const Color(0xFF30C360),
                  // Needs to match snapshot grayish color when disabled? Default switch behavior handles it.
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Container(
            height: 65.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: ShapeDecoration(
              color: const Color(0xFFF0F1F3),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0x19012356)),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: TextField(
              controller: controller.promptController,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'write sentences',
                hintStyle: TextStyle(
                  color: const Color(0x7F012356),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResetButton() {
    return GestureDetector(
      onTap: controller.resetToDefault,
      child: Container(
        height: 48.h,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: const Color(0xFFDD2E34),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFDD2E34)),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(
          'Reset to Default',
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

  Widget _buildUpdateButton() {
    return GestureDetector(
      onTap: controller.updateRules,
      child: Container(
        height: 48.h,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: const Color(0xFF0581EF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(
          'Update Rules', // Request says "Update Rules", screenshot matches.
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
