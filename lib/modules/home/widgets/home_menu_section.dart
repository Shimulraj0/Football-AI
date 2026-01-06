import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import 'home_action_card.dart';

class HomeMenuSection extends StatelessWidget {
  const HomeMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Assuming icons might not exist, creating reusable SVG paths references.
    // In real scenario, user should provide these assets. I will use a placeholder or existing ones.
    const String iconUsers = "assets/icons/users.svg"; // Placeholder name
    const String iconTrophy = "assets/icons/trophy.svg"; // Placeholder name
    const String iconChart = "assets/icons/chart_bar.svg"; // Placeholder name
    const String iconMonitor = "assets/icons/monitor.svg"; // Placeholder name
    const String iconChat = "assets/icons/chat_bubble.svg"; // Placeholder name
    const String iconCrown = "assets/icons/crown.svg"; // Placeholder name

    // Background Images - Change these to customize each row's background individually
    const String bgTeam = "assets/images/Container(4).png";
    const String bgTraining =
        "assets/images/Container(4).png"; // Change this path for different image
    const String bgPerformance =
        "assets/images/Container(4).png"; // Change this path for different image
    const String bgDirector =
        "assets/images/Container(4).png"; // Change this path for different image
    const String bgCoach =
        "assets/images/Container(4).png"; // Change this path for different image
    const String bgPremium =
        "assets/icons/Containerr.svg"; // Keeping original for premium

    // Using a list for data to keep build method clean
    final List<Map<String, dynamic>> menuItems = [
      {
        "title": "Team Management",
        "subtitle":
            "View and edit players, assign drills and\ntrack attendance",
        "icon": iconUsers,
        "background": bgTeam, // Team Management Background
        "padding": const EdgeInsets.all(12),
        "isPremium": false,
      },
      {
        "title": "Training Strategy",
        "subtitle": "Get AI suggestions for formations, drills and\ngame plans",
        "icon": iconTrophy,
        "background": bgTraining, // Training Strategy Background
        "isPremium": false,
      },
      {
        "title": "Performance Reports",
        "subtitle": "Review team or individual player progress\nand statistics",
        "icon": iconChart,
        "background": bgPerformance, // Performance Reports Background
        "isPremium": false,
      },
      {
        "title": "Technical Director",
        "subtitle": "Review team or individual player progress\nand statistics",
        "icon": iconMonitor,
        "background": bgDirector, // Technical Director Background
        "isPremium": false,
      },
      {
        "title": "Ask Coach AI",
        "subtitle": "Get instant answers to your coaching\nquestions",
        "icon": iconChat,
        "background": bgCoach, // Ask Coach AI Background
        "isPremium": false,
      },
      {
        "title": "Upgrade to Premium",
        "subtitle": "Unlock advanced playbooks and exclusive\ncoaching content",
        "icon": iconCrown,
        "background": bgPremium, // Upgrade to Premium Background
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
          iconPath: item['icon'],
          backgroundIconPath: item['background'],
          iconPadding: item['padding'],
          isPremium: item['isPremium'],
          onTap: () {
            if (item['title'] == "Team Management") {
              Get.toNamed(AppRoutes.teamManagement);
            }
          },
        );
      },
    );
  }
}
