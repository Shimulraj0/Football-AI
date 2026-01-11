import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../../global_widgets/custom_bottom_nav_bar.dart';
import '../controllers/player_home_controller.dart';
import '../controllers/training_feedback_controller.dart';

class TrainingFeedbackView extends GetView<TrainingFeedbackController> {
  const TrainingFeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    // Attempt to find PlayerHomeController to manage bottom nav
    final playerHomeController = Get.find<PlayerHomeController>();

    return BaseScaffold(
      title: "Training Feedback",
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Summary Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF00204A),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Training Feedback",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Reflect on today's training session",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Form Container
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFF2196F3), // Blue border
                  width: 1.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Passing Field
                  _buildQuestionLabel(
                    "How did you feel about your passing today?",
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: controller.passingController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText:
                          "I felt confident with short passes but struggled with long balls...",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      contentPadding: const EdgeInsets.all(12),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 2. Focus Level Slider
                  _buildSliderSection(
                    "Rate your focus level (1-10):",
                    controller.focusLevel,
                    "Low Focus",
                    "High Focus",
                  ),

                  // 3. Energy Level Slider
                  _buildSliderSection(
                    "Rate your energy level (1-10):",
                    controller.energyLevel,
                    "Low Energy",
                    "High Energy",
                  ), // Typo in design 'engry', fixing to 'energy'
                  // 4. Confidence Level Slider
                  _buildSliderSection(
                    "Rate your confidence level (1-10):",
                    controller.confidenceLevel,
                    "Low Confidence",
                    "High Confidence",
                  ),

                  // 5. Additional Notes
                  _buildQuestionLabel("Additional notes (optional)"),
                  const SizedBox(height: 10),
                  TextField(
                    controller: controller.notesController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: "Any other thoughts about today's session...",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      contentPadding: const EdgeInsets.all(12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: 0, // Always highlight Home
        onItemTapped: (index) {
          if (index != 0) {
            playerHomeController.changeTabIndex(index);
            Get.back(); // Return to PlayerHome
          } else {
            Get.back(); // Just return to PlayerHome main view
          }
        },
      ),
    );
  }

  Widget _buildQuestionLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF00204A),
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildSliderSection(
    String question,
    RxDouble value,
    String lowLabel,
    String highLabel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                question,
                style: const TextStyle(
                  color: Color(0xFF00204A),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                value.value.toInt().toString(),
                style: const TextStyle(
                  color: Color(0xFF00204A),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => SliderTheme(
            data: SliderTheme.of(Get.context!).copyWith(
              activeTrackColor: const Color(0xFF00204A),
              inactiveTrackColor: Colors.grey[300],
              thumbColor: const Color(0xFF00204A),
              overlayColor: const Color(0xFF00204A).withAlpha(32),
              trackHeight: 4.0,
            ),
            child: Slider(
              value: value.value,
              min: 1,
              max: 10,
              divisions: 9,
              onChanged: (val) {
                value.value = val;
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                lowLabel,
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              Text(
                highLabel,
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
