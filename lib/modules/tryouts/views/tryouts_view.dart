import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../../../routes/app_routes.dart';
import '../../home/controllers/home_controller.dart';

import '../controllers/tryouts_controller.dart';

class TryoutsView extends GetView<TryoutsController> {
  const TryoutsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showBackButton: false,
      headerContent: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
        child: Row(
          children: [
            Container(
              width: 51.w,
              height: 51.w,
              decoration: ShapeDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/icons/Ellipse13.png"),
                  fit: BoxFit.cover,
                ),
                shape: OvalBorder(
                  side: BorderSide(width: 1, color: Colors.white),
                ),
              ),
            ),
            SizedBox(width: 13.w),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter',
                  ),
                ),
                Text(
                  "TRYOUTS MODULE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
            Spacer(),
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
                child: Icon(
                  Icons.notifications_outlined,
                  size: 20.w,
                  color: const Color(0xFF012355),
                ),
              ),
            ),
          ],
        ),
      ),
      showBottomNav: true, // Use the standard bottom nav which matches design
      backgroundColor: const Color(0xFFF5F9FF),
      bottomNavigationBar: () {
        if (Get.isRegistered<HomeController>()) {
          final homeController = Get.find<HomeController>();
          return Obx(
            () => CustomBottomNavBar(
              selectedIndex: homeController.selectedIndex.value,
              onItemTapped: homeController.changeTabIndex,
            ),
          );
        } else {
          // Fallback if HomeController is not present (e.g. direct navigation)
          return CustomBottomNavBar(
            selectedIndex: 0,
            onItemTapped: (index) {
              if (index == 0) {
                Get.offAllNamed(AppRoutes.home);
              } else if (index == 1) {
                Get.offNamed(AppRoutes.aiCommunication);
              } else if (index == 2) {
                Get.offNamed(AppRoutes.settings);
              }
            },
          );
        }
      }(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              TryoutMenuCard(
                title: 'Tryout Setup',
                imagePath: 'assets/images/setup.png',
                onTap: controller.navigateToSetup,
              ),
              SizedBox(height: 16.h),
              TryoutMenuCard(
                title: 'Tryout Eval Entry',
                imagePath: 'assets/images/Eval_Entry.png',
                onTap: controller.navigateToEvalEntry,
              ),
              SizedBox(height: 16.h),
              TryoutMenuCard(
                title: 'Tryout Scoring',
                imagePath: 'assets/images/Scoring.png',
                onTap: controller.navigateToScoring,
              ),
              SizedBox(height: 16.h),
              TryoutMenuCard(
                title: 'Tryout Placement',
                imagePath: 'assets/images/Placement.png',
                onTap: controller.navigateToPlacement,
              ),
              SizedBox(height: 16.h),
              TryoutMenuCard(
                title: 'Tryout Invites',
                imagePath: 'assets/images/Invites.png',
                onTap: controller.navigateToInvites,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class TryoutMenuCard extends StatefulWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const TryoutMenuCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  State<TryoutMenuCard> createState() => _TryoutMenuCardState();
}

class _TryoutMenuCardState extends State<TryoutMenuCard> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) {
        setState(() => isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => isPressed = false),
      child: Container(
        width: double.infinity,
        height: 97.h,
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
        decoration: ShapeDecoration(
          color: isPressed ? const Color(0xFF012356) : const Color(0xFFEAF2FD),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
          children: [
            Image.asset(widget.imagePath, width: 48.w, height: 48.w),
            SizedBox(width: 13.w),
            Expanded(
              child: Text(
                widget.title,
                style: TextStyle(
                  color: isPressed ? Colors.white : const Color(0xFF012355),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
