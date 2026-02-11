import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../../../../core/values/app_padding.dart';
import '../controllers/home_controller.dart';
import 'home_action_card.dart';

class HomeMenuSection extends StatelessWidget {
  const HomeMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<HomeController>()) {
      return const SizedBox.shrink();
    }
    final controller = Get.find<HomeController>();

    // Using a list for data to keep build method clean
    // Note: Replace these with actual icon assets when available
    final List<Map<String, dynamic>> menuItems = [
      {
        "title": "Team Management",
        "subtitle": "View and edit players, assign drills and track attendance",
        "iconPath": "assets/images/user.png",
        "isPremium": false,
        "backgroundColor": const Color(0xFFEAF2FD),
        "iconBackgroundColor": const Color(0xFFFEFEFE),
        "borderColor": null, // No border for first item based on snippet 1
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
        "backgroundColor": const Color(0x19BCCDE7), // Transparent Blue
        "iconBackgroundColor": const Color(0xFFFEFEFE),
        "borderColor": const Color(0xFF012355),
      },
      {
        "title": "Periodization integration",
        "subtitle": "Review teams time or date slot",
        "iconPath": "assets/images/states.png", // Reusing chart icon
        "isPremium": false,
        "backgroundColor": const Color(0x19BCCDE7), // Transparent Blue
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
        "borderColor": const Color(
          0xFF012355,
        ), // No border in snippet? Wait, snippet 5 has border side
        // Snippet 5: BorderSide(width: 1, color: Color(0xFF012355))
      },
      {
        "title": "Upgrade to Premium",
        "subtitle": "Unlock advanced playbooks and exclusive coaching content",
        "iconPath": "assets/icons/vip.svg",
        "isPremium": true,
        // Premium specific styling handled by flag or overrides?
        // Snippet 6: BG 0xFF012355, IconBG 0xFFDCFCE7, Title Gold, Subtitle White
        // We can pass them explicitly or rely on isPremium defaults if they match.
        // Let's pass explicitly to be safe if defaults differ.
        "backgroundColor": const Color(0xFF012355),
        "iconBackgroundColor": const Color(0xFFDCFCE7),
        "titleColor": const Color(0xFFFFD700),
        "subtitleColor": const Color(0xFFFEFEFE),
        "borderColor": null,
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
            } else if (item['title'] == "Ask Coach AI") {
              controller.changeTabIndex(1);
            }
          },
        );
      },
    );
  }
}
