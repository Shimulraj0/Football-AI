import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/home_menu_section.dart';
import '../widgets/profile_image.dart';
import '../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../../core/values/app_colors.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, // #EEF5FF
      body: Stack(
        children: [
          Column(
            children: [
              // Header Container
              Container(
                height: 180, // Adjust height as needed
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF00204A),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: SafeArea(
                  // Ensure content is safe from notch
                  bottom: false,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Avatar
                      // Avatar
                      ProfileImage(
                        imagePath: 'assets/icons/Ellipse 13.png',
                        onTap: () {
                          // Handle profile tap
                        },
                      ),
                      const SizedBox(width: 16),
                      // Welcome Text
                      Expanded(
                        // Use Expanded to avoid overflow
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

                      // Notification Icon
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
                ),
              ),

              // Scrollable List
              // Scrollable List
              const Expanded(child: HomeMenuSection()),
            ],
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
