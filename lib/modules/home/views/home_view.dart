import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/home_menu_section.dart';

import 'coach_ai_view.dart';
import '../../settings/views/settings_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../../global_widgets/profile_image.dart';
import '../../../global_widgets/persistent_header.dart';
import '../../../global_widgets/custom_back_button.dart';
import '../../../core/values/app_colors.dart';

import '../../../core/utils/size_utils.dart';
import '../../../global_widgets/base_scaffold.dart';

// ... imports ...

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: AppColors.background,
      headerContent: Obx(() {
        // Determine header content based on selected index
        if (controller.selectedIndex.value == 1) {
          // Coach AI Header
          return Row(
            children: [
              CustomBackButton(
                onPressed: () => controller.changeTabIndex(0), // Back to Home
                backgroundColor: Colors.white,
                iconColor: const Color(0xFF00204A),
              ),
              Expanded(
                child: Text(
                  "Coach AI",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Balance the back button spacing
              SizedBox(width: 40.w),
            ],
          );
        } else if (controller.selectedIndex.value == 2) {
          // Settings Header Content
          return Row(
            children: [
              CustomBackButton(
                onPressed: () => controller.changeTabIndex(0),
                backgroundColor: Colors.white,
                iconColor: const Color(0xFF00204A),
              ),
              SizedBox(width: 16.w),
              Text(
                "Settings", // Fixed Title
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color.fromARGB(255, 250, 249, 249),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
            ],
          );
        }

        // Home Header Content (Default)
        return PersistentHeader(
          height: 140.h,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileImage(
                    imagePath: 'assets/icons/Ellipse 13.png',
                    size: 51.w,
                    onTap: () {},
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          color: const Color(0xFFFEFEFE),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        "Coach Dashboard",
                        style: TextStyle(
                          color: const Color(0xFFFEFEFE),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
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
                    borderRadius: BorderRadius.circular(30.w),
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30.w),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(30.w),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/icons/Notification.svg",
                        width: 24.w,
                        height: 24.w,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
      body: Obx(() {
        if (controller.selectedIndex.value == 2) {
          return const SettingsView(isEmbedded: true);
        } else if (controller.selectedIndex.value == 1) {
          return const CoachAiView();
        }
        return const HomeMenuSection();
      }),
      bottomNavigationBar: Obx(
        () => CustomBottomNavBar(
          selectedIndex: controller.selectedIndex.value,
          onItemTapped: controller.changeTabIndex,
        ),
      ),
    );
  }
}
