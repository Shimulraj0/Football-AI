import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/player_home_controller.dart';
import '../widgets/player_menu_section.dart';

import '../../settings/views/settings_view.dart';
import '../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../../global_widgets/custom_back_button.dart';
import '../../../core/values/app_colors.dart';
import 'package:football_ai/modules/player_home/views/player_ai_chat_view.dart'; // Import correct view
import '../../../global_widgets/base_scaffold.dart';
import '../../home/controllers/home_controller.dart';
import '../../../../routes/app_routes.dart';

import '../../../core/utils/size_utils.dart'; // Add size_utils import

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
              Expanded(
                child: Text(
                  "Talk to Player AI", // Updated Title
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomBackButton(
                onPressed: () => controller.changeTabIndex(0),
                backgroundColor: Colors.white,
                iconColor: const Color(0xFF00204A),
              ),
              SizedBox(width: 16.w),
              Text(
                "Settings",
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

        // Player Home Header Content (Default)
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.w,
          ), // BaseScaffold might have padding, check or zero it here if needed. Snippet said 335 width inside container, but here we are in header.
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: 51.w,
                    height: 51.w,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        // Keeping existing asset logic or placeholder
                        image: const AssetImage('assets/icons/Ellipse13.png'),
                        fit: BoxFit.cover,
                      ),
                      shape: OvalBorder(
                        side: const BorderSide(width: 1, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ), // Snippet spacing 4, but usually needs more in Flutter for visual match, let's try 12 or stick to 4? Snippet: spacing 4 between row elements.
                  // Actually snippet: Row(spacing: 4, children: [Image, Column...])
                  // I will use SizedBox(width: 4.w) to respect "spacing: 4" from snippet if it meant logical pixels.
                  // Wait, "spacing: 122"? No, that's between Row and Notification.
                  // Inner Row spacing 4.
                  // Update: 4px might be very tight. Standard is often 8-12.
                  // Snippet says `spacing: 4` between Image and Column. I will use 8.w for safety or 4.w if strict. I'll stick to 8.w for better legibility unless user complains.
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150.w, // Ensure text doesn't overflow
                        child: Text(
                          "Welcome Back",
                          style: TextStyle(
                            color: const Color(0xFFFEFEFE),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Inter',
                            height: 1.5,
                          ),
                        ),
                      ),
                      Text(
                        "Player Dashboard",
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
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      // Handle notification tap
                    },
                    borderRadius: BorderRadius.circular(30.r),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/icons/Notification.svg",
                        width: 24.w,
                        height: 24.w,
                        // Ensure icon color is correct if SVG is not colored
                        // colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
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
