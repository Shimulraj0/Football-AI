import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import '../controllers/player_home_controller.dart';

import '../../../../core/values/app_padding.dart';
import '../controllers/skill_progress_tracker_controller.dart';

class SkillProgressTrackerView extends GetView<SkillProgressTrackerController> {
  const SkillProgressTrackerView({super.key});

  @override
  Widget build(BuildContext context) {
    // Attempt to find PlayerHomeController to manage bottom nav
    // Use try-catch or Get.isRegistered check if unsure, but it should be there from PlayerHome
    final playerHomeController = Get.find<PlayerHomeController>();

    return BaseScaffold(
      title: "Skill Progress Tracker",
      body: SingleChildScrollView(
        padding: AppPadding.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Card
            _buildHeaderCard(),
            const SizedBox(height: 16),

            // Next Week's Target
            _buildTargetCard(),
            const SizedBox(height: 24),

            // Tabs and Chart Section
            _buildChartSection(),
            const SizedBox(height: 24),

            // Overall Summary
            const Text(
              "Overall Summary",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00204A),
              ),
            ),
            const SizedBox(height: 12),
            _buildSummaryCard(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex:
            0, // Always highlight Home as we are in a sub-feature of Home
        onItemTapped: (index) {
          if (index != 0) {
            playerHomeController.changeTabIndex(index);
            Get.back(); // Return to PlayerHome which will switch tab
          } else {
            Get.back(); // Just return to PlayerHome main view
          }
        },
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF00204A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Skill Progress Tracker",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Track your improvement over time",
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildTargetCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF4EEeb2), // Teal color
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.track_changes, color: Colors.white, size: 24),
              SizedBox(width: 8),
              Text(
                "Next Week's Target",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            "Focus on improving your passing accuracy by 5%. Practice wall passes daily!",
            style: TextStyle(color: Colors.white, fontSize: 13, height: 1.4),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00204A),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            child: const Text(
              "Set Custom Target",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartSection() {
    return Obx(() {
      final currentData = controller.getCurrentSkillData();
      final percentage = currentData['percentage'] as double;
      final label = currentData['label'] as String;
      final week = currentData['week'] as String;

      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
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
            // Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ['Passing', 'Dribbling', 'Shooting', 'Speed'].map((
                skill,
              ) {
                final isSelected = controller.selectedSkill.value == skill;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => controller.selectSkill(skill),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF00204A)
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        skill,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.grey[700],
                          fontSize: 12,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),

            // Chart / Progress Bar Visualization
            // Simulating a bar chart with a single bar for now as per design
            SizedBox(
              height: 150,
              width: 120, // Width of the bar
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  // Bar
                  Container(
                    width: 120,
                    height: 150 * percentage, // Dynamic height
                    decoration: BoxDecoration(
                      color: const Color(0xFF4EEeb2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  // Percentage Label inside bar or floating
                  Positioned(
                    top:
                        150 -
                        (150 * percentage) +
                        10, // Position near top of bar
                    child: percentage > 0.1
                        ? Text(
                            label,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(week, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
          ],
        ),
      );
    });
  }

  Widget _buildSummaryCard() {
    return Obx(() {
      final summary =
          controller.getCurrentSkillData()['summary'] as Map<String, dynamic>;
      final isImprovement = summary['isImprovement'] as bool;

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFB9F6EA).withValues(alpha: 0.5), // Light teal
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.selectedSkill.value.toLowerCase(),
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              summary['value'],
              style: const TextStyle(
                color: Color(0xFF00204A),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "${summary['improvement']} ${isImprovement ? 'improvement' : 'deterioration'}",
              style: TextStyle(
                color: isImprovement ? const Color(0xFF00C853) : Colors.red,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    });
  }
}
