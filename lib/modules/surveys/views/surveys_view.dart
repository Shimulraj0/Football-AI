import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/surveys_controller.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../../core/utils/size_utils.dart';
import '../../../routes/app_routes.dart';

class SurveysView extends GetView<SurveysController> {
  const SurveysView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      showBottomNav: true,
      headerContent: _buildHeader(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Surveys',
              style: TextStyle(
                color: const Color(0xFF012356),
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
            ),
            SizedBox(height: 16.h),
            _buildSurveyCard(
              title: "Coach Fall survey",
              subtitle: "Conduct feedback for fall season",
              icon: Icons.assignment_outlined,
              onTap: () => Get.toNamed(
                AppRoutes.surveyDetails,
                arguments: "Coach Fall survey",
              ),
            ),
            SizedBox(height: 16.h),
            _buildSurveyCard(
              title: "Coach Spring Survey",
              subtitle: "Conduct feedback for spring season",
              icon: Icons.assignment_outlined,
              onTap: () => Get.toNamed(
                AppRoutes.surveyDetails,
                arguments: "Coach Spring Survey",
              ),
            ),
            SizedBox(height: 16.h),
            _buildSurveyCard(
              title: "Parent Survey",
              subtitle: "Gather feedback from parents",
              icon: Icons.people_outline,
              onTap: () => Get.toNamed(
                AppRoutes.surveyDetails,
                arguments: "Parent Survey",
              ),
            ),
            SizedBox(height: 16.h),
            _buildSurveyCard(
              title: "Players Survey",
              subtitle: "Get insights from player",
              icon: Icons.sports_soccer_outlined,
              onTap: () => Get.toNamed(
                AppRoutes.surveyDetails,
                arguments: "Players Survey",
              ),
            ),
            SizedBox(height: 16.h),
            _buildSurveyCard(
              title: "DOC Survey",
              subtitle: "Feedback for the Director of Coaching",
              icon: Icons.directions_run_outlined,
              onTap: () =>
                  Get.toNamed(AppRoutes.surveyDetails, arguments: "DOC Survey"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 13.h),
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Container(
            width: 51.w,
            height: 51.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.w),
              image: const DecorationImage(
                image: AssetImage('assets/icons/Ellipse13.png'),
                fit: BoxFit.cover,
              ),
              color: Colors.grey[300],
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "Survey",
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications_outlined,
              color: const Color(0xFF00204A),
              size: 24.w,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSurveyCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
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
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: const Color(0xFFF9F9F9),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(icon, color: const Color(0xFF575757), size: 24.w),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: const Color(0xFF012356),
              size: 24.w,
            ),
          ],
        ),
      ),
    );
  }
}
