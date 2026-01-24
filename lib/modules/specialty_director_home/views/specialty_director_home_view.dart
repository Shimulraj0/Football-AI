import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../routes/app_routes.dart';
import '../../../../global_widgets/base_scaffold.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/specialty_director_home_controller.dart';

class SpecialtyDirectorHomeView
    extends GetView<SpecialtyDirectorHomeController> {
  const SpecialtyDirectorHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      // The BaseScaffold likely handles some SafeArea/background, but user requested specific structure.
      // We will embed their Column into the body.
      // User's code has a Header + 3 Cards. 3 Cards are wrapped in containers.
      // We need to adapt their fixed widths (375, 335) to our responsive design (w/h).
      showHeader: true, // User provided their own header design in the column
      headerHeight: 120.h,
      headerContent: _buildHeaderContent(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // _buildCustomHeader(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                children: [
                  _buildInfoCard(
                    title: "GK Director",
                    lines: [
                      "Shot stopping & footwork",
                      "Distribution under pressure",
                    ],
                    icon:
                        Icons.sports_soccer, // Placeholder until asset is known
                    onTap: () => Get.toNamed(AppRoutes.gkDirectorHome),
                  ),
                  SizedBox(height: 16.h),
                  _buildInfoCard(
                    title: "A&C Director",
                    lines: ["Balance & reaction", "Change of director"],
                    icon: Icons.directions_run,
                  ),
                  SizedBox(height: 16.h),
                  _buildInfoCard(
                    title: "S&C Director",
                    lines: ["Load management", "Recovery work"],
                    icon: Icons.fitness_center,
                  ),
                  SizedBox(height: 100.h), // Space for bottom nav
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: () {
        if (Get.isRegistered<HomeController>()) {
          final homeController = Get.find<HomeController>();
          return Obx(
            () => CustomBottomNavBar(
              selectedIndex: homeController.selectedIndex.value,
              onItemTapped: homeController.changeTabIndex,
            ),
          );
        }
        return null;
      }(),
    );
  }

  Widget _buildHeaderContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 51.w,
                    height: 51.w,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/icons/Ellipse13.png"),
                        fit: BoxFit.cover,
                      ),
                      shape: const OvalBorder(
                        side: BorderSide(width: 1, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          color: const Color(0xFFFEFEFE),
                          fontSize: 18.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Specialty Director',
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
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/Notification.svg",
                    width: 24.w,
                    height: 24.w,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF00204A),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required List<String> lines,
    required IconData icon, // Placeholder for specific icon asset
    VoidCallback? onTap, // Added optional callback
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 335.w,
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
        decoration: ShapeDecoration(
          color: const Color(0xFFEAF2FD),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows: [
            BoxShadow(
              color: const Color(0x1E000000),
              blurRadius: 10,
              offset: const Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // Align to top
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: ShapeDecoration(
                color: const Color(0xFFFEFEFE),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Icon(icon, color: const Color(0xFF012355)),
              // User code had a Stack with a placeholder box.
              // Using Icon until asset path is clear.
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
                        color: const Color(0xFF012355),
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
