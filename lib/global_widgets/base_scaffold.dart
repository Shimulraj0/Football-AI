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

    Widget scaffoldContent = AnnotatedRegion<SystemUiOverlayStyle>(
      value: showHeader
          ? SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
            )
          : SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            if (showHeader)
              PersistentHeader(
                height: headerHeight ?? 124.h,
                child: headerContent ?? _buildDefaultHeader(),
              ),
            Expanded(
              child: SafeArea(top: !showHeader, bottom: true, child: body),
            ),
          ],
        ),
        bottomNavigationBar: isKeyboardOpen
            ? null
            : effectiveBottomNavigationBar,
      ),
    );

    if (Get.isRegistered<HomeController>()) {
      return Obx(() {
        final homeController = Get.find<HomeController>();
        final bool canPopStack = Navigator.of(context).canPop();
        final bool isNotHomeTab = homeController.selectedIndex.value != 0;
        final bool hasCustomAction = onBackPress != null;

        // We block pop if:
        // 1. User has a custom handler (we let them handle it)
        // 2. OR We are at root AND need to switch to home tab
        final bool shouldBlock =
            hasCustomAction || (!canPopStack && isNotHomeTab);

        return PopScope(
          canPop: !shouldBlock,
          onPopInvokedWithResult: (bool didPop, Object? result) async {
            if (didPop) return;

            if (hasCustomAction) {
              onBackPress!();
            } else if (!canPopStack && isNotHomeTab) {
              homeController.changeTabIndex(0);
            } else {
              // Fallback default
              Get.back(result: result);
            }
          },
          child: scaffoldContent,
        );
      });
    } else {
      // Logic for screens without HomeController (e.g. Auth)
      return PopScope(
        canPop: onBackPress == null,
        onPopInvokedWithResult: (bool didPop, Object? result) async {
          if (didPop) return;
          if (onBackPress != null) {
            onBackPress!();
          } else {
            Get.back(result: result);
          }
        },
        child: scaffoldContent,
      );
    }
  }

  Widget _buildDefaultHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showBackButton)
            CustomBackButton(
              onPressed:
                  onBackPress ??
                  () {
                    // Default behavior: just pop. The PopScope will handle the rest (stack vs tab)
                    // IF we want the button to strictly pop current view first (standard behavior)
                    Get.back();
                  },
              backgroundColor: const Color(0xFFE8F3FF),
              iconColor: const Color(0xFF00204A),
            ),
          if (title != null) ...[
            // Remove Expanded to avoid centering issues if we want "SpaceBetween" or specific layout
            // But usually title is centered.
            // Let's keep existing logic but adjust for padding.
            // Actually, ClubHierarchyView used MainAxisAlignment.spaceBetween.
            // Let's use Expanded for centering title, but handle the right side balance.
            Expanded(
              child: Text(
                title!,
                textAlign:
                    TextAlign.center, // Always center for now as per design
                style: TextStyle(
                  color: Colors.white,
                  fontSize:
                      16.sp, // Reduced to 16.sp to match ClubHierarchyView
                  fontWeight: FontWeight.w600, // Reduced weight to match
                  fontFamily: 'Inter',
                ),
              ),
            ),
            if (showBackButton)
              SizedBox(width: 44.w), // Balance back button size (usually 44ish)
          ],
        ],
      ),
    );
  }
}
