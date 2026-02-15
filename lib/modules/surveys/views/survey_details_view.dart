import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/surveys_controller.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../../core/utils/size_utils.dart';
import '../../../routes/app_routes.dart';

class SurveyDetailsView extends GetView<SurveysController> {
  const SurveyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final String title = Get.arguments ?? "Coach Fall Survey";
    return BaseScaffold(
      showHeader: true,
      showBottomNav: true,
      title: title,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: title == "Parent Survey"
            ? _buildParentSurveyContent(title)
            : title == "Players Survey"
            ? _buildPlayerSurveyContent(title)
            : title == "DOC Survey"
            ? _buildDocSurveyContent(title)
            : _buildDefaultSurveyContent(title),
      ),
    );
  }

  Widget _buildDocSurveyContent(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Evaluated Players',
          style: TextStyle(
            color: const Color(0xFF012356),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
        SizedBox(height: 12.h),
        _buildProgressCard(
          title: "Survey Progress",
          percentageText: "50% Complete",
          percentageValue: 0.50,
          responsesText: "13 of 31 Responses Submitted",
          icon: Icons.monitor_outlined,
        ),
        SizedBox(height: 24.h),
        Text(
          'Survey Questions',
          style: TextStyle(
            color: const Color(0xFF012356),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
        SizedBox(height: 12.h),
        _buildQuestionCard(
          "1. How satisfied are you with your child’s soccer development?",
          child: _buildMcqResultWithRadio(
            options: ["Poor", "Okey", "Good", "Excellent"],
            selectedOption: "Poor",
            statsText: "43% Dissatisfied",
            responseCount: "3 Response",
          ),
        ),
        SizedBox(height: 16.h),
        _buildQuestionCard(
          "2. What area needs more attention?",
          child: _buildShortAnswerBox("I don’t support with defensive drills."),
        ),
        SizedBox(height: 16.h),
        _buildQuestionCard(
          "3. Are there challenges impacting your role?",
          child: _buildBinaryResult(
            yesPercent: "Yes 64%",
            noPercent: "No 40%",
            yesCount: "12",
            noCount: "6",
          ),
        ),
        SizedBox(height: 16.h),
        _buildQuestionCard(
          "4. Do you have any suggestions or concerns you’d like to share?",
          child: _buildStatusLabel("2 unread response"),
        ),
        SizedBox(height: 24.h),
        Row(
          children: [
            Expanded(child: _buildSendReminderButton()),
            SizedBox(width: 16.w),
            Expanded(child: _buildPreviewButton(title)),
          ],
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget _buildDefaultSurveyContent(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Evaluated Players',
          style: TextStyle(
            color: const Color(0xFF012356),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
        SizedBox(height: 12.h),
        _buildProgressCard(
          title: title,
          percentageText: "79% Complete",
          percentageValue: 0.79,
          responsesText: "11 of 14 Responses Submitted",
          icon: Icons.cast_outlined,
        ),
        SizedBox(height: 24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Survey Questions',
              style: TextStyle(
                color: const Color(0xFF012356),
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
            ),
            _buildAddQuestionButton(),
          ],
        ),
        SizedBox(height: 12.h),
        Obx(
          () => _buildQuestionCard(
            "1. How effective were the training session?",
            child: _buildMcqOptions(
              questionId: 1,
              options: ["Poor", "Okey", "Good", "Excellent"],
            ),
          ),
        ),
        SizedBox(height: 16.h),
        _buildQuestionCard(
          "2. What areas need the most development?",
          child: _buildShortAnswerBox("Short Answer"),
        ),
        SizedBox(height: 16.h),
        Obx(
          () => _buildQuestionCard(
            "3. How well did your players understand the coaching points?",
            child: _buildMcqOptions(
              questionId: 3,
              options: ["Poor", "Okey", "Good", "Excellent"],
            ),
          ),
        ),
        SizedBox(height: 16.h),
        _buildQuestionCard(
          "4. Any additional comments or suggestions?",
          child: _buildShortAnswerBox("Write suggestions"),
        ),
        SizedBox(height: 24.h),
        _buildPreviewButton(title),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget _buildParentSurveyContent(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Evaluated Players',
          style: TextStyle(
            color: const Color(0xFF012356),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
        SizedBox(height: 12.h),
        _buildProgressCard(
          title: "Survey Progress",
          percentageText: "32% Complete",
          percentageValue: 0.32,
          responsesText: "18 of 56 Responses Submitted",
          icon: Icons.monitor_outlined,
        ),
        SizedBox(height: 24.h),
        Text(
          'Survey Questions',
          style: TextStyle(
            color: const Color(0xFF012356),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
        SizedBox(height: 12.h),
        _buildQuestionCard(
          "1. How satisfied are you with your child’s soccer development?",
          child: _buildStarRatingResult(),
        ),
        SizedBox(height: 16.h),
        _buildQuestionCard(
          "2. What would make your child’s experience better?",
          child: _buildShortAnswerBox(
            "I’d like to see more one-on-one coaching session.",
          ),
        ),
        SizedBox(height: 16.h),
        _buildQuestionCard(
          "3. Do you need more information on our club’s plans?",
          child: _buildBinaryResult(
            yesPercent: "Yes 67%",
            noPercent: "No 33%",
            yesCount: "12",
            noCount: "6",
          ),
        ),
        SizedBox(height: 16.h),
        _buildQuestionCard(
          "4. Are there areas you need more support in as a coach?",
          child: _buildStatusLabel("1 unread response"),
        ),
        SizedBox(height: 24.h),
        Row(
          children: [
            Expanded(child: _buildSendReminderButton()),
            SizedBox(width: 16.w),
            Expanded(child: _buildPreviewButton(title)),
          ],
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget _buildPlayerSurveyContent(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Evaluated Players',
          style: TextStyle(
            color: const Color(0xFF012356),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
        SizedBox(height: 12.h),
        _buildProgressCard(
          title: "Survey Progress",
          percentageText: "42% Complete",
          percentageValue: 0.42,
          responsesText: "13 of 31 Responses Submitted",
          icon: Icons.monitor_outlined,
        ),
        SizedBox(height: 24.h),
        Text(
          'Survey Questions',
          style: TextStyle(
            color: const Color(0xFF012356),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
        SizedBox(height: 12.h),
        _buildQuestionCard(
          "1. How satisfied are you with your child’s soccer development?",
          child: _buildMcqResultWithRadio(
            options: ["Very Dissatisfied", "New drill/game", "Coach feedback"],
            selectedOption: "Very Dissatisfied",
            statsText: "38% Dissatisfied",
            responseCount: "3 Response",
          ),
        ),
        SizedBox(height: 16.h),
        _buildQuestionCard(
          "2. What would make your child’s experience better?",
          child: _buildShortAnswerBox(
            "I’d like to see more one-on-one coaching session.",
          ),
        ),
        SizedBox(height: 16.h),
        _buildQuestionCard(
          "3. Do you need more information on our club’s plans?",
          child: _buildBinaryResult(
            yesPercent: "Yes 54%",
            noPercent: "No 33%",
            yesCount: "12",
            noCount: "6",
          ),
        ),
        SizedBox(height: 16.h),
        _buildQuestionCard(
          "4. Are there areas you need more support in as a coach?",
          child: _buildStatusLabel("1 unread response"),
        ),
        SizedBox(height: 24.h),
        Row(
          children: [
            Expanded(child: _buildSendReminderButton()),
            SizedBox(width: 16.w),
            Expanded(child: _buildPreviewButton(title)),
          ],
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget _buildProgressCard({
    required String title,
    required String percentageText,
    required double percentageValue,
    required String responsesText,
    required IconData icon,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 6.r,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: const Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, color: const Color(0xFF012356), size: 24.w),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: const Color(0xFF012356),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                      ),
                    ),
                    Text(
                      percentageText,
                      style: TextStyle(
                        color: const Color(0xFF012356).withValues(alpha: 0.5),
                        fontSize: 12.sp,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Stack(
                  children: [
                    Container(
                      height: 6.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE5E7EB),
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: percentageValue,
                      child: Container(
                        height: 6.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFF132D67),
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  responsesText,
                  style: TextStyle(
                    color: const Color(0xFF012356).withValues(alpha: 0.8),
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddQuestionButton() {
    return GestureDetector(
      onTap: () => controller.addQuestion(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: const Color(0xFFF3F4F6)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4.r,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, color: const Color(0xFF012356), size: 20.w),
            SizedBox(width: 4.w),
            Text(
              "Add Question",
              style: TextStyle(
                color: const Color(0xFF012356),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionCard(String question, {required Widget child}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 6.r,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 12.h),
          child,
        ],
      ),
    );
  }

  Widget _buildMcqOptions({
    required int questionId,
    required List<String> options,
  }) {
    final selected = controller.selectedOptions[questionId] ?? "";
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: options.map((option) {
          final isSelected = option == selected;
          return GestureDetector(
            onTap: () => controller.updateOption(questionId, option),
            child: Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 20.w,
                    height: 20.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF1A56DB)
                            : const Color(0xFFD1D5DB),
                        width: isSelected ? 6.w : 1.w,
                      ),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    option,
                    style: TextStyle(
                      color: const Color(0xFF6B7280),
                      fontSize: 14.sp,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildShortAnswerBox(String placeholder) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4FF),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        placeholder,
        style: TextStyle(
          color: const Color(0xFF6B7280),
          fontSize: 14.sp,
          fontFamily: 'Inter',
        ),
      ),
    );
  }

  Widget _buildPreviewButton(String title) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: () => Get.toNamed(AppRoutes.surveyResults, arguments: title),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3B67AA),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(
          "Preview Survey",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
      ),
    );
  }

  Widget _buildStarRatingResult() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF0FB),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < 3 ? Icons.star : Icons.star_border,
                    color: index < 3
                        ? const Color(0xFFE5C282)
                        : const Color(0xFF012356),
                    size: 16.w,
                  );
                }),
              ),
              SizedBox(width: 8.w),
              Text(
                "Very Dissatisfied",
                style: TextStyle(
                  color: const Color(0xFF012356).withValues(alpha: 0.8),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildOptionPercentage("10%", "Dissatisfied"),
              _buildOptionPercentage("14%", "Neutral"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOptionPercentage(String percentage, String label) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: percentage,
            style: TextStyle(
              color: const Color(0xFFE5C282),
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
          TextSpan(
            text: " $label",
            style: TextStyle(
              color: const Color(0xFF012356).withValues(alpha: 0.8),
              fontSize: 12.sp,
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBinaryResult({
    required String yesPercent,
    required String noPercent,
    required String yesCount,
    required String noCount,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex:
                  67, // Using fixed flex for visual consistency with design patterns
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF4269B5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6.r),
                    bottomLeft: Radius.circular(6.r),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  yesPercent,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 33,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAECF7),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6.r),
                    bottomRight: Radius.circular(6.r),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  noPercent,
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildResponseCount(yesCount, "Yes responses"),
            _buildResponseCount(noCount, "No responses"),
          ],
        ),
      ],
    );
  }

  Widget _buildResponseCount(String count, String label) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: count,
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
          TextSpan(
            text: " $label",
            style: TextStyle(
              color: const Color(0xFF012356).withValues(alpha: 0.8),
              fontSize: 12.sp,
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusLabel(String text) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF0FB),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: const Color(0xFF012356),
          fontSize: 12.sp,
          fontFamily: 'Inter',
        ),
      ),
    );
  }

  Widget _buildSendReminderButton() {
    return SizedBox(
      height: 52.h,
      child: ElevatedButton(
        onPressed: () => controller.sendReminder(),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFC9D6F5),
          foregroundColor: const Color(0xFF012356),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(
          "Send Reminder",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
      ),
    );
  }

  Widget _buildMcqResultWithRadio({
    required List<String> options,
    required String selectedOption,
    required String statsText,
    required String responseCount,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF0FB),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 12.w,
            runSpacing: 8.h,
            children: options.map((option) {
              final isSelected = option == selectedOption;
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 16.w,
                    height: 16.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF1A56DB)
                            : const Color(0xFFD1D5DB),
                        width: isSelected ? 5.w : 1.w,
                      ),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    option,
                    style: TextStyle(
                      color: const Color(0xFF012356).withValues(alpha: 0.8),
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                statsText,
                style: TextStyle(
                  color: const Color(0xFFE5C282),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                ),
              ),
              Text(
                responseCount,
                style: TextStyle(
                  color: const Color(0xFF012356).withValues(alpha: 0.8),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
