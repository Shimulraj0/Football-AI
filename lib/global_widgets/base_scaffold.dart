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
  final String? subtitle;
  final Widget? headerImage;
  final Widget? headerContent;
  final Widget? bottomNavigationBar;
  final Color backgroundColor;
  final bool showBackButton;
  final VoidCallback? onBackPress;
  final bool showHeader;
  final double? headerHeight;
  final bool showBottomNav;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backButtonBackgroundColor;
  final Color? backButtonIconColor;

  const BaseScaffold({
    super.key,
    required this.body,
    this.title,
    this.subtitle,
    this.headerImage,
    this.headerContent,
    this.bottomNavigationBar,
    this.backgroundColor = AppColors.background,
    this.showBackButton = true,
    this.leading,
    this.actions,
    this.showHeader = true,
    this.onBackPress,
    this.headerHeight,
    this.showBottomNav = true,
    this.backButtonBackgroundColor,
    this.backButtonIconColor,
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
      final homeController = Get.find<HomeController>();
      effectiveBottomNavigationBar = Obx(
        () => CustomBottomNavBar(
          selectedIndex: homeController.selectedIndex.value,
          onItemTapped: homeController.changeTabIndex,
        ),
      );
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
                height:
                    headerHeight ??
                    (subtitle != null || headerContent != null
                        ? 100.h
                        : 80.h), // Adjust height for subtitle or custom content
                child: headerContent ?? _buildDefaultHeader(context),
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

        final bool isNotHomeTab = homeController.selectedIndex.value != 0;
        final bool hasCustomAction = onBackPress != null;

        // We block pop if:
        // 1. User has a custom handler (we let them handle it)
        // 2. OR We are at root of a non-home tab (we want to go to home)
        final bool shouldBlock =
            hasCustomAction || (isNotHomeTab && homeController.isAtTabRoot);

        return PopScope(
          canPop: !shouldBlock,
          onPopInvokedWithResult: (bool didPop, dynamic result) {
            if (didPop) return;

            if (hasCustomAction) {
              onBackPress!();
            } else if (shouldBlock) {
              // If we blocked because we are at tab root, go to home
              homeController.changeTabIndex(0);
            } else {
              // Fallback default
              Get.back();
            }
          },
          child: scaffoldContent,
        );
      });
    } else {
      // Logic for screens without HomeController (e.g. Auth)
      return PopScope(
        canPop: onBackPress == null,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          if (onBackPress != null) {
            onBackPress!();
          } else {
            Get.back();
          }
        },
        child: scaffoldContent,
      );
    }
  }

  Widget _buildDefaultHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 13.h),
      // Alignment bottom centered to match design padding
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top Row: Leading (Back) & Actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Leading / Back Button
              if (leading != null)
                leading!
              else if (showBackButton)
                CustomBackButton(
                  onPressed:
                      onBackPress ??
                      () {
                        if (Get.isRegistered<HomeController>()) {
                          Get.find<HomeController>().onBack();
                        } else {
                          Get.back();
                        }
                      },
                  backgroundColor:
                      backButtonBackgroundColor ??
                      const Color(0xFFE8F3FF), // Default to Light Blue Circle
                  iconColor:
                      backButtonIconColor ??
                      const Color(0xFF012355), // Default to Deep Blue Icon
                )
              else
                SizedBox(
                  width: 44.w,
                ), // Placeholder to balance if needed, or just zero

              Flexible(
                child: Text(
                  title!,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                  ),
                ),
              ),

              // Actions (Right side)
              if (actions != null)
                Row(mainAxisSize: MainAxisSize.min, children: actions!)
              else
                SizedBox(
                  width: showBackButton ? 44.w : 0,
                ), // Balance back button
            ],
          ),

          // Title / Subtitle Area
          if (title != null && subtitle != null) ...[
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (headerImage != null) ...[
                  headerImage!,
                  SizedBox(width: 8.w),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        subtitle!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
