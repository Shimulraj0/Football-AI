import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/curriculum_adaptation_controller.dart';

class CurriculumAdaptationView extends GetView<CurriculumAdaptationController> {
  const CurriculumAdaptationView({super.key});

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
                      "Team Frequency change",
                      style: TextStyle(
                        color: Color(0xFF00204A),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildFrequencyDropdown(),
                    const SizedBox(height: 24),
                    const Text(
                      "AI Suggestion",
                      style: TextStyle(
                        color: Color(0xFF00204A),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildAiSuggestionCard(),
                    const SizedBox(height: 24),
                    _buildDaySchedule("Monday", [
                      _buildChip(
                        "Passing Drills",
                        Icons.sports_soccer,
                        () => _handleChipTap("Passing Drills", "Monday"),
                      ),
                      _buildChip(
                        "Shooting Session",
                        Icons.sports_gymnastics,
                        () => _handleChipTap("Shooting Session", "Monday"),
                      ), // Using gymnastics as placeholder for active
                    ]),
                    const SizedBox(height: 20),
                    _buildDaySchedule("Tuesday", [
                      _buildChip(
                        "Passing Drills",
                        Icons.sports_soccer,
                        () => _handleChipTap("Passing Drills", "Tuesday"),
                      ),
                      _buildChip(
                        "Conditioning",
                        Icons.fitness_center,
                        () => _handleChipTap("Conditioning", "Tuesday"),
                      ),
                    ]),
                    const SizedBox(height: 20),
                    _buildDaySchedule("Wednesday", [
                      // Correcting typo "Wensday" to Wednesday, but user might want raw. I'll use Wednesday.
                      _buildChip(
                        "Passing Drills",
                        Icons.sports_soccer,
                        () => _handleChipTap("Passing Drills", "Wednesday"),
                      ),
                      _buildChip(
                        "Conditioning",
                        Icons.fitness_center,
                        () => _handleChipTap("Conditioning", "Wednesday"),
                      ),
                    ]),
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
                "Curriculum Adaptation",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
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

  Widget _buildFrequencyDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Obx(
        () => DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: controller.selectedFrequency.value,
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: controller.frequencyOptions.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(color: Color(0xFF00204A)),
                ),
              );
            }).toList(),
            onChanged: controller.setFrequency,
          ),
        ),
      ),
    );
  }

  Widget _buildAiSuggestionCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.lightbulb_outline,
            color: Color(0xFF00204A),
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              "Consider adding 15-minute conditioning session on Wednesday.", // Matches design text (with typo fixed to Wednesday, though design says Wensday)
              style: TextStyle(
                color: const Color(0xFF00204A).withValues(alpha: 0.8),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDaySchedule(String day, List<Widget> chips) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          day,
          style: const TextStyle(
            color: Color(0xFF00204A),
            fontSize: 16,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            decorationColor: Color(0xFF00204A),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(spacing: 12, runSpacing: 12, children: chips),
      ],
    );
  }

  Widget _buildChip(String label, IconData icon, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 16, color: const Color(0xFF00204A)),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(color: Color(0xFF00204A), fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleChipTap(String feature, String day) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              feature,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00204A),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Details for $feature on $day. Here you can adjust specific parameters or view drill instructions.",
              style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00204A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  "Close",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
