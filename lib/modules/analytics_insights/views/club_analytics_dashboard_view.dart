import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../../../routes/app_routes.dart';

class ClubAnalyticsDashboardView extends StatelessWidget {
  const ClubAnalyticsDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              _buildHeader(),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(20.0),
                  children: [
                    const Text(
                      "Club Analytics",
                      style: TextStyle(
                        color: Color(0xFF00204A),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildStatsGrid(),
                    const SizedBox(height: 24),
                    const Text(
                      "Player Development",
                      style: TextStyle(
                        color: Color(0xFF00204A),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildPlayerDevelopmentCard(),
                    const SizedBox(height: 80),
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
              selectedIndex: 0,
              onItemTapped: (index) {
                switch (index) {
                  case 0:
                    Get.offNamed(AppRoutes.technicalDirectorHome);
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
        color: Color(0xFF00204A),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () => Get.back(),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Color(0xFF00204A),
                size: 24,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "Club Analytics Dashboard",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatItem("Attendance", "78%", const Color(0xFF00204A)),
              _buildStatItem("Player Growth", "54%", const Color(0xFF00204A)),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatItem("Session", "16", const Color(0xFF00204A)),
              _buildStatItem("IDPs", "23", const Color(0xFF00204A)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Expanded(
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: color.withValues(alpha: 0.8),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerDevelopmentCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildProgressBar("Technical", 70, const Color(0xFF0055FF)),
          const SizedBox(height: 16),
          _buildProgressBar("Tactical", 55, const Color(0xFF0055FF)),
          const SizedBox(height: 16),
          _buildProgressBar("Physical", 90, const Color(0xFF00C853)),
          const SizedBox(height: 16),
          _buildProgressBar("Social", 45, const Color(0xFF0055FF)),
        ],
      ),
    );
  }

  Widget _buildProgressBar(String label, int percentage, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF00204A),
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            Text(
              "$percentage%",
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            Container(
              height: 8,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  width: constraints.maxWidth * (percentage / 100),
                  height: 8,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
