import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/home_menu_section.dart';
import '../widgets/profile_image.dart';
import 'coach_ai_view.dart';
import '../../settings/views/settings_view.dart';
import '../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../../global_widgets/custom_back_button.dart';
import '../../../core/values/app_colors.dart';

import '../../../global_widgets/persistent_header.dart';

// ... imports ...

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // Persistent Header
          Obx(() {
            // Determine header content based on selected index
            if (controller.selectedIndex.value == 1) {
              // Coach AI Header
              return PersistentHeader(
                height: 120, // Slightly shorter for chat
                child: Row(
                  children: [
                    CustomBackButton(
                      onPressed: () =>
                          controller.changeTabIndex(0), // Back to Home
                      backgroundColor: Colors.white,
                      iconColor: const Color(0xFF00204A),
                    ),
                    const Expanded(
                      child: Text(
                        "Coach AI",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Balance the back button spacing
                    const SizedBox(width: 40),
                  ],
                ),
              );
            } else if (controller.selectedIndex.value == 2) {
              // Settings Header Content
              return PersistentHeader(
                height: 160,
                child: Row(
                  children: [
                    CustomBackButton(
                      onPressed: () => controller.changeTabIndex(0),
                      backgroundColor: Colors.white,
                      iconColor: const Color(0xFF00204A),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      "Settings", // Fixed Title
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 250, 249, 249),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              );
            }

            // Home Header Content (Default)
            return PersistentHeader(
              height: 180,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileImage(
                    imagePath: 'assets/icons/Ellipse 13.png',
                    onTap: () {
                      // Handle profile tap
                    },
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Welcome Back",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Coach Dashboard",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.white,
                    shape: const CircleBorder(),
                    child: InkWell(
                      onTap: () {
                        // Handle notification tap
                      },
                      customBorder: const CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          "assets/icons/Notification.svg",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),

          // Content Area
          Expanded(
            child: Obx(() {
              if (controller.selectedIndex.value == 2) {
                return const SettingsView(isEmbedded: true);
              } else if (controller.selectedIndex.value == 1) {
                return const CoachAiView();
              }
              return const HomeMenuSection();
            }),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => CustomBottomNavBar(
          selectedIndex: controller.selectedIndex.value,
          onItemTapped: controller.changeTabIndex,
        ),
      ),
    );
  }
}
