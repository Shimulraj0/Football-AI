import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../../../../core/values/app_padding.dart';
import '../controllers/player_home_controller.dart';
import '../../home/widgets/home_action_card.dart';

class PlayerMenuSection extends StatelessWidget {
  const PlayerMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PlayerHomeController>();

    // Using a list for data to keep build method clean
    final List<Map<String, dynamic>> menuItems = [
      {
        "title": "Team Management",
        "subtitle": "View and edit players, assign drills and track attendance",
        "iconPath": "assets/images/user.png",
        "isPremium": false,
      },
      {
        "title": "Training Strategy",
        "subtitle": "Get AI suggestions for formations, drills and game plans",
        "iconPath": "assets/images/trophy.png",
        "isPremium": false,
      },
      {
        "title": "Performance Reports",
        "subtitle": "Review team or individual player progress and statistics",
        "iconPath": "assets/images/states.png",
        "isPremium": false,
      },
      {
        "title": "Ask Coach AI",
        "subtitle": "Get instant answers to your coaching questions",
        "iconPath": "assets/images/chat.png",
        "isPremium": false,
      },
      {
        "title": "Upgrade to Premium",
        "subtitle": "Unlock advanced playbooks and exclusive coaching content",
        "iconPath": "assets/icons/vip.svg",
        "isPremium": true,
      },
    ];

    return ListView.builder(
      padding: AppPadding.pagePadding,
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return HomeActionCard(
          title: item['title'],
          subtitle: item['subtitle'],
          iconPath: item['iconPath'],
          isPremium: item['isPremium'],
          onTap: () {
            if (item['title'] == "Team Management") {
              Get.toNamed(AppRoutes.teamManagement);
            } else if (item['title'] == "Training Strategy") {
              Get.toNamed(AppRoutes.trainingStrategy);
            } else if (item['title'] == "Performance Reports") {
              Get.toNamed(AppRoutes.performanceReports);
            } else if (item['title'] == "Ask Coach AI") {
              controller.changeTabIndex(1);
            }
          },
        );
      },
    );
  }
}
