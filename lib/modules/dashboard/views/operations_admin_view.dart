import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../global_widgets/profile_image.dart';

import '../../../../core/utils/size_utils.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/dashboard_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';

class OperationsAdminView extends GetView<DashboardController> {
  const OperationsAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize Home Route for this persona
    // We can do this here or in onInit if we bind a controller specific to this view.
    // Since we are using DashboardBinding which now provides HomeController, let's use it.
    final homeController = Get.find<HomeController>();
    // Set the "Home" for this view context to be this view itself, effectively.
    // But wait, if we are ALREADY here, we want "Home" button to keep us here or reset state.
    // The previous logic was: onTap: () => Get.offAllNamed(AppRoutes.dashboard) for Home button.
    // But OperationsAdminView IS the "Home" for this persona.
    // So usually we want 'Home' to mean 'Dashboard' (Persona Selection) or 'This View'.
    // Looking at the code: "onTap: () => Get.offAllNamed(AppRoutes.dashboard)" taking user back to Role Selection.
    // So let's set currentHomeRoute to AppRoutes.dashboard for now as per previous behavior.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeController.currentHomeRoute.value = AppRoutes.dashboard;
      homeController.selectedIndex.value = 0; // Ensure Home tab is selected
    });

    return BaseScaffold(
      showHeader: true,
      headerHeight: 120.h,
      headerContent: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar
              ProfileImage(imagePath: "assets/icons/Ellipse13.png", size: 51.w),
              SizedBox(width: 8.w),
              // Welcome Text
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 159.w,
                    child: Text(
                      'Welcome Back',
                      style: TextStyle(
                        color: const Color(0xFFFEFEFE),
                        fontSize: 18.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'Operations & Billing Director',
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
          // Notification Icon
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
                  Color(0xFF012355),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            // Statistic Cards Row
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    title: 'Total Revenue Collected',
                    amount: '\$85,420',
                    subtitle: 'This Season',
                    subtitleColor: const Color(0x99012356),
                    amountColor: const Color(0xFF012356),
                    // Using a generic icon because snippet shows "Stack()" which implies an asset/icon not fully defined in text.
                    // Sticking to existing logic or reasonable default.
                    iconData: Icons.account_balance_wallet_outlined,
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: _buildStatCard(
                    title: 'Outstanding Payment',
                    amount: '\$3,250',
                    subtitle: 'Overdue',
                    subtitleColor: const Color(0xFFEB7B36),
                    amountColor: const Color(0xFFDD2E34),
                    iconData: Icons.warning_amber_rounded,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),

            // Number/Info Cards Row (Invoices / Active Registrations)
            Row(
              children: [
                Expanded(
                  child: _buildInfoCard(title: 'Invoices Sent', value: '24'),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: _buildInfoCard(
                    title: 'Active Registrations',
                    value: '264',
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),

            // Action Grid
            // Row 1
            Row(
              children: [
                Expanded(
                  child: _buildActionItem(
                    title: 'New Invoice',
                    subtitle: '32 Weeks',
                    onTap: () => Get.toNamed(AppRoutes.billing),
                    // Placeholder icon or specific asset if known
                    iconAssets: "assets/icons/invoice.svg",
                    fallbackIcon: Icons.receipt_long_outlined,
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: _buildActionItem(
                    title: 'Parent Billing Portal',
                    onTap: () => Get.toNamed(AppRoutes.parentPlayerPortal),
                    iconAssets: "assets/icons/billing.svg",
                    fallbackIcon: Icons.family_restroom,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            // Row 2
            Row(
              children: [
                Expanded(
                  child: _buildActionItem(
                    title: 'Manage Registrations',
                    onTap: () => Get.toNamed(AppRoutes.parentPlayerPortal),
                    iconAssets: "assets/icons/manage.svg",
                    fallbackIcon: Icons.manage_accounts_outlined,
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: _buildActionItem(
                    title: 'Download Report',
                    onTap: () => Get.toNamed(AppRoutes.performanceReports),
                    iconAssets: "assets/icons/download.svg",
                    fallbackIcon: Icons.download_outlined,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => CustomBottomNavBar(
          selectedIndex: homeController.selectedIndex.value,
          onItemTapped: homeController.changeTabIndex,
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String amount,
    required String subtitle,
    required Color subtitleColor,
    required Color amountColor,
    IconData? iconData,
  }) {
    return Container(
      width: 163.w,
      padding: EdgeInsets.all(8.w),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.w)),
        shadows: [
          BoxShadow(
            color: const Color(0x28000000),
            blurRadius: 6,
            offset: const Offset(0, 3),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 24.w,
                  height: 24.w,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: Icon(
                    iconData,
                    size: 24.w,
                    color: const Color(0xFF012356),
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            amount,
            style: TextStyle(
              color: amountColor,
              fontSize: 18.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            subtitle,
            style: TextStyle(
              color: subtitleColor,
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({required String title, required String value}) {
    return Container(
      width: 163.w,
      height: 98.h, // Fixed height from snippet hints
      decoration: ShapeDecoration(
        color: const Color(0xFFFEFEFE),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.w)),
        shadows: [
          BoxShadow(
            color: const Color(0x28000000),
            blurRadius: 6,
            offset: const Offset(0, 3),
            spreadRadius: 0,
          ),
        ],
      ),
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            value,
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem({
    required String title,
    String? subtitle,
    VoidCallback? onTap,
    String? iconAssets,
    IconData? fallbackIcon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 163.w,
        padding: EdgeInsets.all(8.w),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.w),
          ),
          shadows: [
            BoxShadow(
              color: const Color(0x28000000),
              blurRadius: 6,
              offset: const Offset(0, 3),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 24.w,
              height: 24.w,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: (iconAssets != null && iconAssets.endsWith('.svg'))
                  ? SvgPicture.asset(iconAssets)
                  : Icon(
                      fallbackIcon,
                      size: 24.w,
                      color: const Color(0xFF012356),
                    ),
            ),
            SizedBox(width: 6.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (subtitle != null) ...[
                    SizedBox(height: 4.h),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: const Color(0x99012356),
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
