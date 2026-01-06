import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/home_action_card.dart';
import '../../../core/values/app_colors.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

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

    // Using a list for data to keep build method clean
    final List<Map<String, dynamic>> menuItems = [
      {
        "title": "Team Management",
        "subtitle":
            "View and edit players, assign drills and\ntrack attendance",
        "icon": iconUsers,
        "isPremium": false,
      },
      {
        "title": "Training Strategy",
        "subtitle": "Get AI suggestions for formations, drills and\ngame plans",
        "icon": iconTrophy,
        "isPremium": false,
      },
      {
        "title": "Performance Reports",
        "subtitle": "Review team or individual player progress\nand statistics",
        "icon": iconChart,
        "isPremium": false,
      },
      {
        "title": "Technical Director",
        "subtitle": "Review team or individual player progress\nand statistics",
        "icon": iconMonitor,
        "isPremium": false,
      },
      {
        "title": "Ask Coach AI",
        "subtitle": "Get instant answers to your coaching\nquestions",
        "icon": iconChat,
        "isPremium": false,
      },
      {
        "title": "Upgrade to Premium",
        "subtitle": "Unlock advanced playbooks and exclusive\ncoaching content",
        "icon": iconCrown,
        "isPremium": true,
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background, // #EEF5FF
      body: Stack(
        children: [
          Column(
            children: [
              // Header Container
              Container(
                height: 180, // Adjust height as needed
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF00204A),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: SafeArea(
                  // Ensure content is safe from notch
                  bottom: false,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Avatar
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                          image: const DecorationImage(
                            image: AssetImage('assets/icons/Ellipse 13.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Fallback if image missing
                        child: const Icon(Icons.person, color: Colors.white70),
                      ),
                      const SizedBox(width: 16),
                      // Welcome Text
                      Expanded(
                        // Use Expanded to avoid overflow
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Welcome Back",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Coach Dashboard",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Notification Icon
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.notifications_none_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Scrollable List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    final item = menuItems[index];
                    return HomeActionCard(
                      title: item['title'],
                      subtitle: item['subtitle'],
                      iconPath: item['icon'],
                      isPremium: item['isPremium'],
                      onTap: () {
                        // Handle navigation based on title or index
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    icon: Icons.home_rounded,
                    label: "Home",
                    isSelected: controller.selectedIndex.value == 0,
                    onTap: () => controller.changeTabIndex(0),
                  ),
                  _buildNavItem(
                    icon: Icons.chat_bubble_outline_rounded,
                    label: "Coach AI",
                    isSelected: controller.selectedIndex.value == 1,
                    onTap: () => controller.changeTabIndex(1),
                  ),
                  _buildNavItem(
                    icon: Icons.settings_outlined,
                    label: "Settings",
                    isSelected: controller.selectedIndex.value == 2,
                    onTap: () => controller.changeTabIndex(2),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFF00204A) : Colors.grey,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? const Color(0xFF00204A) : Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
