import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../controllers/home_controller.dart';
import 'home_action_card.dart';

class HomeMenuSection extends StatelessWidget {
  const HomeMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    // Using a list for data to keep build method clean
    // Note: Replace these with actual icon assets when available
    final List<Map<String, dynamic>> menuItems = [
      {
        "title": "Team Management",
        "subtitle":
            "View and edit players, assign drills and\ntrack attendance",
        "iconPath": "assets/images/user.png",
        "isPremium": false,
      },
      {
        "title": "Training Strategy",
        "subtitle": "Get AI suggestions for formations, drills and\ngame plans",
        "iconPath": "assets/images/trophy.png",
        "isPremium": false,
      },
      {
        "title": "Performance Reports",
        "subtitle": "Review team or individual player progress\nand statistics",
        "iconPath": "assets/images/states.png",
        "isPremium": false,
      },
      {
        "title": "Technical Director",
        "subtitle": "Review team or individual player progress\nand statistics",
        "iconPath": "assets/images/analysis.png",
        "isPremium": false,
      },
      {
        "title": "Ask Coach AI",
        "subtitle": "Get instant answers to your coaching\nquestions",
        "iconPath": "assets/images/chat.png",
        "isPremium": false,
      },
      {
        "title": "Upgrade to Premium",
        "subtitle": "Unlock advanced playbooks and exclusive\ncoaching content",
        "iconPath": "assets/icons/vip.svg",
        "isPremium": true,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
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
            } else if (item['title'] == "Ask Coach AI") {
              controller.changeTabIndex(1);
            }
          },
        );
      },
    );
  }
}
