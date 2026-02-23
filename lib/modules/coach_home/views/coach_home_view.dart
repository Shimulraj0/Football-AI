import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../../core/utils/size_utils.dart';
import '../../home/controllers/home_controller.dart';
import '../../../routes/app_routes.dart';
import '../controllers/coach_home_controller.dart';

import '../../../core/values/app_padding.dart';
import '../../home/widgets/home_action_card.dart';

class CoachHomeView extends GetView<CoachHomeController> {
  const CoachHomeView({super.key});

  List<Map<String, dynamic>> _menuItems(CoachHomeController controller) {
    return [
      {
        "title": "Team Management",
        "subtitle": "View and edit players, assign drills and track attendance",
        "iconPath": "assets/images/user.png",
        "isPremium": false,
        "backgroundColor": const Color(0xFFEAF2FD),
        "iconBackgroundColor": const Color(0xFFFEFEFE),
        "borderColor": null,
      },
      {
        "title": "Training Strategy",
        "subtitle": "Get AI suggestions for formations, drills and game plans",
        "iconPath": "assets/images/trophy.png",
        "isPremium": false,
        "backgroundColor": const Color(0xFFEAF2FD),
        "iconBackgroundColor": const Color(0xFFFEFEFE),
        "borderColor": const Color(0xFF012355),
      },
      {
        "title": "Performance Reports",
        "subtitle": "Review team or individual player progress and statistics",
        "iconPath": "assets/images/states.png",
        "isPremium": false,
        "backgroundColor": const Color(0xFFEAF2FD),
        "iconBackgroundColor": const Color(0xFFFEFEFE),
        "borderColor": const Color(0xFF012355),
      },
      {
        "title": "Periodization integration",
        "subtitle": "Review teams time or date slot",
        "iconPath": "assets/images/states.png",
        "isPremium": false,
        "backgroundColor": const Color(0xFFEAF2FD),
        "iconBackgroundColor": const Color(0xFFFEFEFE),
        "borderColor": const Color(0xFF012355),
      },
      {
        "title": "Ask Coach AI",
        "subtitle": "Get instant answers to your coaching questions",
        "iconPath": "assets/images/chat.png",
        "isPremium": false,
        "backgroundColor": const Color(0xFFEAF2FD),
        "iconBackgroundColor": const Color(0xFFFEFEFE),
        "borderColor": const Color(0xFF012355),
      },
      {
        "title": "Upgrade to Premium",
        "subtitle": "Unlock advanced playbooks and exclusive coaching content",
        "iconPath": "assets/icons/vip.svg",
        "isPremium": true,
        "backgroundColor": const Color(0xFF012355),
        "iconBackgroundColor": const Color(0xFFDCFCE7),
        "titleColor": const Color(0xFFFFD700),
        "subtitleColor": const Color(0xFFFEFEFE),
        "borderColor": null,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<HomeController>()) {
      Get.find<HomeController>().currentHomeRoute.value = AppRoutes.coachHome;
    }

    return BaseScaffold(
      headerContent: _buildHeader(),
      showBottomNav: true,
      body: ListView.builder(
        padding: AppPadding.pagePadding,
        itemCount: _menuItems(controller).length,
        itemBuilder: (context, index) {
          final item = _menuItems(controller)[index];
          return HomeActionCard(
            title: item['title'],
            subtitle: item['subtitle'],
            iconPath: item['iconPath'],
            isPremium: item['isPremium'],
            backgroundColor: item['backgroundColor'],
            iconBackgroundColor: item['iconBackgroundColor'],
            borderColor: item['borderColor'],
            titleColor: item['titleColor'],
            subtitleColor: item['subtitleColor'],
            onTap: () {
              if (item['title'] == "Team Management") {
                Get.toNamed(AppRoutes.teamManagement);
              } else if (item['title'] == "Training Strategy") {
                Get.toNamed(AppRoutes.trainingStrategy);
              } else if (item['title'] == "Performance Reports") {
                Get.toNamed(AppRoutes.performanceReports);
              } else if (item['title'] == "Periodization integration") {
                Get.toNamed(AppRoutes.periodizationIntegration);
              } else if (item['title'] == "Ask Coach AI") {
                if (Get.isRegistered<HomeController>()) {
                  Get.find<HomeController>().changeTabIndex(1);
                }
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: 375.w,
      height: 124.h, // Fixed height validation
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 13.h),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 51.w,
                height: 51.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.w),
                  image: const DecorationImage(
                    image: AssetImage('assets/icons/Ellipse13.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: const Color(0xFFFEFEFE), // From snippet
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: 6.h), // Spacing 6 from snippet
                  Text(
                    "Coach Dashboard",
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
            padding: EdgeInsets.all(8.w),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications_outlined,
              color: const Color(0xFF00204A),
              size: 24.w,
            ),
          ),
        ],
      ),
    );
  }
}
