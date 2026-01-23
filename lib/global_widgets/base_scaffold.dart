import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../core/values/app_colors.dart';
import 'custom_back_button.dart';
import 'persistent_header.dart';
import '../../core/utils/size_utils.dart';
import 'custom_bottom_nav_bar.dart';
import '../modules/home/controllers/home_controller.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final String? title;
  final Widget? headerContent;
  final Widget? bottomNavigationBar;
  final Color backgroundColor;
  final bool showBackButton;
  final VoidCallback? onBackPress;
  final bool showHeader;
  final double? headerHeight;
  final bool showBottomNav;

  const BaseScaffold({
    super.key,
    required this.body,
    this.title,
    this.headerContent,
    this.bottomNavigationBar,
    this.backgroundColor = AppColors.background,
    this.showBackButton = true,
    this.showHeader = true,
    this.onBackPress,
    this.headerHeight,
    this.showBottomNav = true,
  });

  @override
  Widget build(BuildContext context) {
    // Check if keyboard is open
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    // Determine effective bottom navigation bar
    Widget? effectiveBottomNavigationBar = bottomNavigationBar;

    // If no custom bottom nav is provided, and we want to show one, check for HomeController
    if (effectiveBottomNavigationBar == null &&
        showBottomNav &&
        !isKeyboardOpen) {
      if (Get.isRegistered<HomeController>()) {
        final homeController = Get.find<HomeController>();
        effectiveBottomNavigationBar = Obx(
          () => CustomBottomNavBar(
            selectedIndex: homeController.selectedIndex.value,
            onItemTapped: homeController.changeTabIndex,
          ),
        );
      }
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: showHeader
          ? SystemUiOverlayStyle.light.copyWith(
              statusBarColor:
                  Colors.transparent, // Let header color show through
              statusBarIconBrightness: Brightness.light, // White icons
              statusBarBrightness: Brightness.dark, // White text on iOS
            )
          : SystemUiOverlayStyle.dark, // Default to dark for no header
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            // Persistent Header - Now handles its own status bar padding/height
            if (showHeader)
              PersistentHeader(
                height: headerHeight ?? 140.h,
                child: headerContent ?? _buildDefaultHeader(),
              ),

            // Main Content
            Expanded(
              child: SafeArea(
                top:
                    !showHeader, // Only apply top SafeArea if there is NO header
                bottom: true, // Always respect bottom (home indicator)
                child: body,
              ),
            ),
          ],
        ),
        // Hide bottom nav bar when keyboard is open to prevent "big space"
        bottomNavigationBar: isKeyboardOpen
            ? null
            : effectiveBottomNavigationBar,
      ),
    );
  }

  Widget _buildDefaultHeader() {
    return Row(
      children: [
        if (showBackButton)
          CustomBackButton(
            onPressed: onBackPress ?? () => Get.back(),
            backgroundColor: Colors.white,
            iconColor: const Color(0xFF00204A),
          ),
        if (title != null) ...[
          if (showBackButton) SizedBox(width: 16.w),
          Expanded(
            child: Text(
              title!,
              textAlign: showBackButton ? TextAlign.left : TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (showBackButton) SizedBox(width: 40.w), // Balance back button
        ],
      ],
    );
  }
}
