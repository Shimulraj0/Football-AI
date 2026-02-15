import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/surveys_controller.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../../core/utils/size_utils.dart';

class SurveyResultsView extends GetView<SurveysController> {
  const SurveyResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    final String title = Get.arguments ?? "Coach Fall Survey";
    return BaseScaffold(
      showHeader: true,
      showBottomNav: true,
      title: "$title - Results",
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
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
            _buildProgressCard(title),
            SizedBox(height: 24.h),
            Text(
              'Survey Questions Analysis',
              style: TextStyle(
                color: const Color(0xFF012356),
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
            ),
            SizedBox(height: 12.h),
            Obx(() => _buildSurveyDetailsSummaryCard()),
            SizedBox(height: 16.h),
            _buildQuestionCard(
              "1. How effective were the training session?",
              child: _buildMcqResult(
                label: "Poor",
                percentage: 0.4,
                others: ["Okey", "Good", "Excellent"],
              ),
            ),
            SizedBox(height: 16.h),
            _buildQuestionCard(
              "3. How well did your players understand the coaching points?",
              child: _buildMcqResult(
                label: "Poor",
                percentage: 0.4,
                others: ["Okey", "Good", "Excellent"],
              ),
            ),
            SizedBox(height: 16.h),
            _buildQuestionCard(
              "4. Any additional comments or suggestions?",
              child: _buildStatusLabel("1 unread response"),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressCard(String title) {
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
            child: Icon(
              Icons.assignment_outlined,
              color: const Color(0xFF012356),
              size: 24.w,
            ),
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
                      "79% Complete",
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
                      widthFactor: 0.79,
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
                  "11 of 14 Responses Submitted",
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

  Widget _buildSurveyDetailsSummaryCard() {
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
          Row(
            children: [
              Icon(
                Icons.assignment_outlined,
                color: const Color(0xFF012356),
                size: 16.w,
              ),
              SizedBox(width: 8.w),
              Text(
                "Survey Results Summary",
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Divider(color: const Color(0xFFE5E7EB), thickness: 1.h),
          SizedBox(height: 8.h),
          _buildDetailRow("Status", "in progress"),
          SizedBox(height: 4.h),
          _buildDetailRow("Due Date", "Dec 30"),
          SizedBox(height: 4.h),
          _buildDetailRow("Question", "8"),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDetailRow(
                "Reminder Send",
                controller.remindersSent.value.toString(),
              ),
              _buildSendReminderButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "$label ",
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: const Color(0xFF012356).withValues(alpha: 0.8),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSendReminderButton() {
    return GestureDetector(
      onTap: () => controller.sendReminder(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: const Color(0xFFE7ECFA),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Text(
          "Send Reminder",
          style: TextStyle(
            color: const Color(0xFF012356),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'Inter',
          ),
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
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 12.h),
          child,
        ],
      ),
    );
  }

  Widget _buildMcqResult({
    required String label,
    required double percentage,
    required List<String> others,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 16.w,
              height: 16.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF9FAFB),
                border: Border.all(
                  color: const Color(0xFF1A56DB),
                  width: 3.5.w,
                ),
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              label,
              style: TextStyle(
                color: const Color(0xFF012356).withValues(alpha: 0.8),
                fontSize: 12.sp,
                fontFamily: 'Inter',
              ),
            ),
            const Spacer(),
            Text(
              "${(percentage * 100).toInt()}%",
              style: TextStyle(
                color: const Color(0xFF012356).withValues(alpha: 0.8),
                fontSize: 12.sp,
                fontFamily: 'Inter',
              ),
            ),
          ],
        ),
        SizedBox(height: 6.h),
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
              widthFactor: percentage,
              child: Container(
                height: 6.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF6D9CE1),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: others.map((e) => _buildOptionLabel(e)).toList(),
        ),
      ],
    );
  }

  Widget _buildOptionLabel(String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16.w,
          height: 16.w,
          decoration: ShapeDecoration(
            color: const Color(0xFFF9FAFB),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.5.w, color: const Color(0xFFD1D5DB)),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          label,
          style: TextStyle(
            color: const Color(0xFF012356).withValues(alpha: 0.8),
            fontSize: 12.sp,
            fontFamily: 'Inter',
          ),
        ),
      ],
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
}
