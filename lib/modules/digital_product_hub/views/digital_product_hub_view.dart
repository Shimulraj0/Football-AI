import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class DigitalProductHubView extends StatelessWidget {
  const DigitalProductHubView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      headerHeight: 124.h, // Fixed height standard
      headerContent: _buildHeaderContent(), // Custom header content
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              _buildEmptyStateCard(),
              SizedBox(height: 32.h),
              Text(
                'Available Surveys',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16.h),
              _buildSurveyItem(
                title: 'Module Cover', // Fixed typo "Moduel" to "Module"
                subtitle: 'Setup title, description, thumbnail',
                icon: Icons.bookmark_border,
                onTap: () => Get.toNamed(AppRoutes.moduleCover),
              ),
              SizedBox(height: 12.h),
              _buildSurveyItem(
                title: 'Tools',
                subtitle: 'Video, drills, text-based lessons',
                icon: Icons.assignment_outlined,
                onTap: () => Get.toNamed(AppRoutes.moduleTools),
              ),
              SizedBox(height: 12.h),
              _buildSurveyItem(
                title: 'AI Assistant',
                subtitle: 'PDFs, checklists, downloads',
                isAi: true,
                onTap: () => Get.toNamed(AppRoutes.aiAssistant),
              ),
              SizedBox(height: 12.h),
              _buildSurveyItem(
                title: 'Progress Tracking',
                subtitle: 'Completion & milestones',
                icon: Icons.donut_large,
                onTap: () => Get.toNamed(AppRoutes.progressTracking),
              ),
              SizedBox(height: 12.h),
              _buildSurveyItem(
                title: 'Module Setting',
                subtitle: 'Visibility, access, pricing',
                icon: Icons.settings_outlined,
                onTap: () => Get.toNamed(AppRoutes.moduleSettings),
              ),
              SizedBox(height: 12.h),
              _buildSurveyItem(
                title: 'AI Rules',
                subtitle: 'Tone, safety & restrictions',
                icon: Icons.psychology_outlined,
                onTap: () => Get.toNamed(AppRoutes.aiRules),
              ),

              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 51.w,
                    height: 51.w,
                    decoration: ShapeDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/icons/Ellipse13.png'),
                        fit: BoxFit.cover,
                      ),
                      shape: OvalBorder(
                        side: BorderSide(width: 1, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 159.w,
                        child: Text(
                          'Welcome Back',
                          style: TextStyle(
                            color: const Color(0xFFFEFEFE),
                            fontSize: 18.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        'Operations & Billing Director',
                        style: TextStyle(
                          color: const Color(0xFFFEFEFE),
                          fontSize: 12.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: 38.w,
                height: 38.w,
                decoration: ShapeDecoration(
                  color: const Color(0xFFFEFEFE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: SvgPicture.asset("assets/icons/Notification.svg"),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget _buildEmptyStateCard() {
    return Container(
      width: 335.w,
      height: 206.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      alignment: Alignment.center,
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
        children: [
          Image.asset('assets/images/EDU.png', width: 48.w, height: 48.w),
          SizedBox(height: 16.h),
          Text(
            'No Digital Products Yet',
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 22.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Create your first digital module to get started',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 12.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 24.h),
          SizedBox(
            width: 194.w,
            height: 40.h,
            child: ElevatedButton(
              onPressed: () => Get.toNamed(AppRoutes.addDigitalProduct),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0581EF),
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                ), // Minimal padding, let alignment handle centering
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Ensure content is centered
                children: [
                  Icon(Icons.add, color: Colors.white, size: 20.sp),
                  SizedBox(width: 4.w),
                  Text(
                    'Add Digital Product',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                          .sp, // Slightly smaller to fit 194px with icon if needed, or keep 16 if it fits. Request didn't specify font size change but 194 is tight for 16sp + icon. Let's try 14sp or 15sp if 16 is too big. Original was 16. Let's stick to 16 first, if it overflows we reduce. Actually 194 is plenty for "Add Digital Product".
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSurveyItem({
    required String title,
    required String subtitle,
    IconData? icon,
    bool isAi = false,
    VoidCallback? onTap,
  }) {
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
                child: isAi
                    ? Text(
                        'AI',
                        style: TextStyle(
                          color: const Color(0xFF575757),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    : Icon(
                        icon ?? Icons.circle,
                        color: const Color(0xFF575757),
                        size: 24.sp,
                      ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: const Color(0xFF575757),
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: const Color(0xFF012356),
              size: 24.sp,
            ),
          ],
        ),
      ),
    );
  }
}
