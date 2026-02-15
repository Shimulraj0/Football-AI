import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/clinics_controller.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../../core/utils/size_utils.dart';
import '../../../routes/app_routes.dart';
import '../../home/controllers/home_controller.dart';

class ClinicsView extends GetView<ClinicsController> {
  const ClinicsView({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<HomeController>()) {
      Get.find<HomeController>().currentHomeRoute.value = AppRoutes.clinics;
    }

    return BaseScaffold(
      headerContent: _buildHeader(),
      showBottomNav: true,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        children: [
          _buildMenuCard(
            title: "Create New Clinic",
            subtitle: "Event Creation & Details",
            icon: Icons.add_box_outlined,
            onTap: () => Get.toNamed(AppRoutes.createClinic),
          ),
          SizedBox(height: 16.h),
          _buildMenuCard(
            title: "Assign Staff",
            subtitle: "Assign Coaches & Docs",
            icon: Icons.group_add_outlined,
            onTap: () => Get.toNamed(AppRoutes.assignStaff),
          ),
          SizedBox(height: 16.h),
          _buildMenuCard(
            title: "Curriculum Builder",
            subtitle: "Design Custom Clinic Session",
            icon: Icons.edit_note_outlined,
            onTap: () => Get.toNamed(AppRoutes.curriculumBuilder),
          ),
          SizedBox(height: 16.h),
          _buildMenuCard(
            title: "Manage Registration",
            subtitle: "View & Track Registrations",
            icon: Icons.assignment_turned_in_outlined,
            onTap: () => Get.toNamed(AppRoutes.manageRegistration),
          ),
          SizedBox(height: 16.h),
          _buildMenuCard(
            title: "Attendance Tracker",
            subtitle: "Record & Review Attendance",
            icon: Icons.how_to_reg_outlined,
            onTap: () => Get.toNamed(AppRoutes.attendanceTracker),
          ),
        ],
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
                onError: _handleImageError,
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
                  "CLINICS & CAMPS MODULE",
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 10.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
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

  static void _handleImageError(Object exception, StackTrace? stackTrace) {
    debugPrint('Error loading image in ClinicsView header: $exception');
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
              child: Icon(icon, color: const Color(0xFF00204A), size: 24.w),
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
            Icon(
              Icons.chevron_right,
              color: const Color(0xFF00204A),
              size: 18.w,
            ),
          ],
        ),
      ),
    );
  }
}
