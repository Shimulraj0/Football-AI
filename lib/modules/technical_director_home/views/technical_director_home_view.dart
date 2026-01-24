import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/technical_director_home_controller.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../global_widgets/profile_image.dart';
import '../../home/controllers/home_controller.dart';

class TechnicalDirectorHomeView
    extends GetView<TechnicalDirectorHomeController> {
  const TechnicalDirectorHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure HomeController knows this is the current home
    if (Get.isRegistered<HomeController>()) {
      Get.find<HomeController>().currentHomeRoute.value =
          AppRoutes.technicalDirectorHome;
    }

    return BaseScaffold(
      headerContent: _buildHeader(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        children: [
          _buildMenuCard(
            title: "Curriculum Engine",
            subtitle: "Create or upload curriculam",
            icon: Icons.assignment_outlined,
            onTap: () => Get.toNamed(AppRoutes.curriculumEngine),
          ),
          const SizedBox(height: 16),
          _buildMenuCard(
            title: "Analytics & Insights",
            subtitle: "See the analytics & AI insights",
            icon: Icons.bar_chart_outlined,
            onTap: () => Get.toNamed(AppRoutes.analyticsInsights),
          ),
          const SizedBox(height: 16),
          _buildMenuCard(
            title: "Curriculum Adaptation",
            subtitle: "You can use adaptive curriculum editor",
            icon: Icons.cached_outlined,
            onTap: () => Get.toNamed(AppRoutes.curriculumAdaptation),
          ),
          const SizedBox(height: 16),
          _buildMenuCard(
            title: "Communication Hub",
            subtitle: "You can use adaptive curriculum editor",
            icon: Icons.chat_bubble_outline,
            onTap: () => Get.toNamed(AppRoutes.communicationHub),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        ProfileImage(imagePath: 'assets/icons/Ellipse13.png', size: 51),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
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
                "Technical Director",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
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
