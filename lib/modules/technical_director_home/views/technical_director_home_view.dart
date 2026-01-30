import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/technical_director_home_controller.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../core/utils/size_utils.dart'; // Ensure size utils is imported
import '../../home/controllers/home_controller.dart';

class TechnicalDirectorHomeView
    extends GetView<TechnicalDirectorHomeController> {
  const TechnicalDirectorHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure HomeController knows this is the current home
    if (Get.isRegistered<HomeController>()) {
      Get.find<HomeController>().currentHomeRoute.value =
          AppRoutes.technicalDirectorHome;
    }

    return BaseScaffold(
      headerContent: _buildHeader(),
      showBottomNav: true,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        children: [
          _buildMenuCard(
            title: "Curriculum Engine",
            subtitle: "Create or upload curriculam",
            icon: Icons.assignment_outlined,
            onTap: () => Get.toNamed(AppRoutes.curriculumEngine),
          ),
          SizedBox(height: 16.h),
          _buildMenuCard(
            title: "Analytics & Insights",
            subtitle: "See the analytics & AI insights",
            icon: Icons.bar_chart_outlined,
            onTap: () => Get.toNamed(AppRoutes.analyticsInsights),
          ),
          SizedBox(height: 16.h),
          _buildMenuCard(
            title: "Curriculum Adaptation",
            subtitle: "You can use adaptive curriculum editor",
            icon: Icons.cached_outlined,
            onTap: () => Get.toNamed(AppRoutes.curriculumAdaptation),
          ),
          SizedBox(height: 16.h),
          _buildMenuCard(
            title: "Communication Hub",
            subtitle: "You can use adaptive curriculum editor",
            icon: Icons.chat_bubble_outline,
            onTap: () => Get.toNamed(AppRoutes.communicationHub),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
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
                "Technical Director",
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
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
    );
  }

  Widget _buildMenuCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10.w,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FB),
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Icon(icon, color: Colors.grey[700], size: 24.w),
            ),
            SizedBox(width: 13.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: const Color(0xFF00204A),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
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
}
