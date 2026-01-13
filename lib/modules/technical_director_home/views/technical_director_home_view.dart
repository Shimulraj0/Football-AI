import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import '../controllers/technical_director_home_controller.dart';

class TechnicalDirectorHomeView
    extends GetView<TechnicalDirectorHomeController> {
  const TechnicalDirectorHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5FA), // Light blue-ish background
      body: Stack(
        children: [
          Column(
            children: [
              _buildHeader(),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 20.0,
                  ),
                  children: [
                    _buildMenuCard(
                      title: "Curriculum Engine",
                      subtitle: "Create or upload curriculam",
                      icon: Icons.assignment_outlined, // Placeholder icon
                      onTap: () {},
                    ),
                    const SizedBox(height: 16),
                    _buildMenuCard(
                      title: "Analytics & Insights",
                      subtitle: "See the analytics & AI insights",
                      icon: Icons.bar_chart_outlined, // Placeholder icon
                      onTap: () {},
                    ),
                    const SizedBox(height: 16),
                    _buildMenuCard(
                      title: "Curriculum Adaptation",
                      subtitle: "You can use adaptive curriculum editor",
                      icon: Icons.cached_outlined, // Placeholder icon
                      onTap: () {},
                    ),
                    const SizedBox(height: 16),
                    _buildMenuCard(
                      title: "Communication Hub",
                      subtitle: "You can use adaptive curriculum editor",
                      icon: Icons.chat_bubble_outline, // Placeholder icon
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Obx(
              () => CustomBottomNavBar(
                selectedIndex: controller.selectedIndex.value,
                onItemTapped: controller.changeTabIndex,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.only(
        top: 60.0,
        left: 20.0,
        right: 20.0,
        bottom: 30.0,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF00204A), // Dark blue
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(
              'assets/images/technical_director_avatar.png',
            ), // Placeholder
            backgroundColor: Colors.grey,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Tecnical Director",
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.notifications_outlined,
              color: Color(0xFF00204A),
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FB),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: Colors.grey[700], size: 28),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Color(0xFF00204A),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(color: Colors.grey[600], fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
