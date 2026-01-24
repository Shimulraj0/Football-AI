import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/player_home_controller.dart';
import '../widgets/player_menu_section.dart';
import '../../../global_widgets/profile_image.dart';

import '../../settings/views/settings_view.dart';
import '../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../../global_widgets/custom_back_button.dart';
import '../../../core/values/app_colors.dart';
import 'package:football_ai/modules/player_home/views/player_ai_chat_view.dart'; // Import correct view
import '../../../global_widgets/base_scaffold.dart';
import '../../home/controllers/home_controller.dart';
import '../../../../routes/app_routes.dart';

class PlayerHomeView extends GetView<PlayerHomeController> {
  const PlayerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<HomeController>()) {
      Get.find<HomeController>().currentHomeRoute.value = AppRoutes.playerHome;
    }

    return BaseScaffold(
      backgroundColor: AppColors.background,
      headerContent: Obx(() {
        // Determine header content based on selected index
        if (controller.selectedIndex.value == 1) {
          // Coach AI Header (Shared)
          return Row(
            children: [
              CustomBackButton(
                onPressed: () => controller.changeTabIndex(0), // Back to Home
                backgroundColor: Colors.white,
                iconColor: const Color(0xFF00204A),
              ),
              const Expanded(
                child: Text(
                  "Talk to Player AI", // Updated Title
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
              const SizedBox(width: 16),
              const Text(
                "Settings",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 250, 249, 249),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
            ],
          );
        }

        // Player Home Header Content (Default)
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileImage(
              imagePath: 'assets/icons/Ellipse13.png', // Or player specific
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
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Player Dashboard",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 12,
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
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset("assets/icons/Notification.svg"),
                ),
              ),
            ),
          ],
        );
      }),
      body: Obx(() {
        if (controller.selectedIndex.value == 2) {
          return const SettingsView(isEmbedded: true);
        } else if (controller.selectedIndex.value == 1) {
          return const PlayerAiChatView(); // Use separated Player AI Chat
        }
        return const PlayerMenuSection();
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
