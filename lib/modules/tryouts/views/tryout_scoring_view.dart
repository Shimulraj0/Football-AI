import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../home/controllers/home_controller.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../../../routes/app_routes.dart';

class TryoutScoringView extends GetView {
  const TryoutScoringView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Tryout Scoring',
      showBackButton: true,
      backgroundColor: const Color(0xFFF5F9FF),
      showBottomNav: true,
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
          return CustomBottomNavBar(
            selectedIndex: 0,
            onItemTapped: (index) {
              if (index == 0) Get.offAllNamed(AppRoutes.home);
            },
          );
        }
      }(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            _buildPlayerCard(),
            SizedBox(height: 16.h),
            _buildSkillsCard(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34.w,
                height: 34.w,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/34x34"),
                    fit: BoxFit.cover,
                  ),
                  shape: OvalBorder(),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Andrew - ',
                            style: TextStyle(
                              color: const Color(0xFF012356),
                              fontSize: 16.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 1.10,
                            ),
                          ),
                          TextSpan(
                            text: 'U10 Boys Tryout',
                            style: TextStyle(
                              color: const Color(0xFF012356),
                              fontSize: 14.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(
                          Icons.menu,
                          size: 16.w,
                          color: const Color(0xFF012356),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'Midfielder',
                          style: TextStyle(
                            color: const Color(0xFF012356),
                            fontSize: 12.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Icon(
                          Icons.login,
                          size: 16.w,
                          color: const Color(0xFF012356),
                        ), // Arrow icon placeholder
                        SizedBox(width: 4.w),
                        Text(
                          'Forward',
                          style: TextStyle(
                            color: const Color(0xFF012356),
                            fontSize: 12.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Position',
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Midfielder',
                    style: TextStyle(
                      color: const Color(0x7F012356),
                      fontSize: 14.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.chevron_right,
                color: const Color(0xFF012356),
                size: 24.w,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Technical Skills',
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),
          _buildSkillItem(
            'Ball Control',
            3,
            'Pending',
            const Color(0xFFFEF2E3),
            const Color(0xFFFFAB43),
          ),
          const Divider(height: 24, color: Color(0xFFEEEEEE)),
          _buildSkillItem(
            'Passing Accuracy',
            4,
            'Progressed',
            const Color(0xFFDDECFC),
            const Color(0xFF5FACFF),
          ),
          const Divider(height: 24, color: Color(0xFFEEEEEE)),
          _buildSkillItem(
            'Dribbling',
            4,
            'Progressed',
            const Color(0xFFDDECFC),
            const Color(0xFF5FACFF),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillItem(
    String title,
    int stars,
    String status,
    Color bgColor,
    Color textColor,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: const Color(0xFF012356),
                fontSize: 14.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < stars ? Icons.star : Icons.star_border,
                  color: const Color(
                    0xFF012356,
                  ), // Assuming dark blue stars based on image feel, or maybe grey
                  size: 16.w,
                );
              }),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
          decoration: ShapeDecoration(
            color: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Text(
            status,
            style: TextStyle(
              color: textColor,
              fontSize: 12.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
