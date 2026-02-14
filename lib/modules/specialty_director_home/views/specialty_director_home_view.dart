import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../routes/app_routes.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/specialty_director_home_controller.dart';

class SpecialtyDirectorHomeView
    extends GetView<SpecialtyDirectorHomeController> {
  const SpecialtyDirectorHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<HomeController>()) {
      Get.find<HomeController>().currentHomeRoute.value =
          AppRoutes.specialtyDirectorHome;
    }

    return BaseScaffold(
      headerContent: _buildHeaderContent(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            _buildInfoCard(
              title: "GK Director",
              lines: [
                "Shot stopping & footwork",
                "Distribution under pressure",
              ],
              icon: Icons.sports_soccer,
              onTap: () => Get.toNamed(AppRoutes.gkDirectorHome),
            ),
            SizedBox(height: 16.h),
            _buildInfoCard(
              title: "A&C Director",
              lines: ["Balance & reaction", "Change of director"],
              icon: Icons.directions_run,
              onTap: () => Get.toNamed(AppRoutes.acDirectorHome),
            ),
            SizedBox(height: 16.h),
            _buildInfoCard(
              title: "S&C Director",
              lines: ["Load management", "Recovery work"],
              icon: Icons.fitness_center,
              onTap: () => Get.toNamed(AppRoutes.scDirectorHome),
            ),
            SizedBox(height: 100.h), // Space for bottom nav
          ],
        ),
      ),
      showBottomNav: true,
    );
  }

  Widget _buildHeaderContent() {
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
                image: AssetImage("assets/icons/Ellipse13.png"),
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
                  'Welcome Back',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Specialty Director',
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
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required List<String> lines,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: 335.w, // Removed fixed width
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: const Color(0xFFEAF2FD),
          borderRadius: BorderRadius.circular(16.w),
          boxShadow: [
            BoxShadow(
              color: const Color(0x1E000000),
              blurRadius: 10.w,
              offset: Offset(0, 4.h),
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Icon(icon, color: const Color(0xFF012355), size: 24.w),
            ),
            SizedBox(width: 13.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: const Color(0xFF012355),
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  ...lines.map(
                    (line) => Text(
                      line,
                      style: TextStyle(
                        color: const Color(0xFF012355).withValues(alpha: 0.8),
                        fontSize: 12.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
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
