import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/director_of_coaching_home_controller.dart';

class DirectorOfCoachingHomeView
    extends GetView<DirectorOfCoachingHomeController> {
  const DirectorOfCoachingHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine the bottom nav index.
    // If we want it to be highlighted as "Home", index 0 is usually appropriate or we can add a specific logic.
    // For now, let's keep it 0 or manage it via controller if it shares the shared HomeController.
    // The previous TD view used `controller.selectedIndex.value`. TechnicalDirectorHomeController extends GetxController.
    // I made DirectorOfCoachingHomeController extend GetxController too.
    // I should add selectedIndex to the controller to support the bottom nav bar.

    return Scaffold(
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
                      title: "Assigned Age groups",
                      subtitle: "Assaign groups as per their age",
                      icon: Icons.sync_alt, // Placeholder for cycle/swap icon
                      onTap: () {
                        Get.toNamed(AppRoutes.assignedAgeGroups);
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildMenuCard(
                      title: "Coaches Oversight",
                      subtitle: "See through coaches Oversight",
                      icon: Icons.alt_route, // Placeholder for path/strategy
                      onTap: () {
                        // Navigate to Coaches Oversight
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildMenuCard(
                      title: "Curriculum Alignment",
                      subtitle: "Adjust curriculum alignment",
                      icon: Icons.assessment_outlined, // Document with chart
                      onTap: () {
                        // Navigate to Curriculum Alignment
                      },
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
            child: CustomBottomNavBar(
              selectedIndex: 0, // Default to 0 for Home
              onItemTapped: (index) {
                switch (index) {
                  case 0:
                    // Already on Home
                    break;
                  case 1:
                    Get.toNamed(AppRoutes.aiCommunication);
                    break;
                  case 2:
                    Get.toNamed(AppRoutes.settings);
                    break;
                }
              },
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
            backgroundImage: AssetImage('assets/icons/Ellipse 13.png'),
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
                  "Director of Coaching (DOC)",
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
