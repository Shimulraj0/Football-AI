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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            // Header / Summary Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
              decoration: ShapeDecoration(
                color: const Color(0xFF012355),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Training Feedback',
                          style: TextStyle(
                            color: Color(0xFFFEFEFE),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Reflect on today's training session",
                          style: TextStyle(
                            color: Color(0xFFFEFEFE),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Form Container
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: ShapeDecoration(
                color: const Color(0xFFFEFEFE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x14000000),
                    blurRadius: 19.80,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Passing Feedback Section
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 311,
                          child: Text(
                            'How did you feel about your passing today?',
                            style: TextStyle(
                              color: Color(0xFF374151),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 11),
                        TextField(
                          controller: controller.passingController,
                          maxLines: 3,
                          style: const TextStyle(
                            color: Color(0xFF575757),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            hintText:
                                'I felt confident with short passes but struggled with long balls...',
                            hintStyle: TextStyle(
                              color: const Color(0xFF575757).withAlpha(128),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                            contentPadding: const EdgeInsets.all(10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xFFE0E0E0),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xFF012355),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 23),
                  // Sliders Section
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSliderSection(
                          "Rate your focus level (1-10): ",
                          controller.focusLevel,
                          "Low Focus",
                          "High Focus",
                        ),
                        const SizedBox(height: 15),
                        _buildSliderSection(
                          "Rate your energy level (1-10): ",
                          controller.energyLevel,
                          "Low Energy",
                          "High Energy",
                        ),
                        const SizedBox(height: 15),
                        _buildSliderSection(
                          "Rate your confidence level (1-10): ",
                          controller.confidenceLevel,
                          "Low Confidence",
                          "High Confidence",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 23),
                  // Additional Notes Section
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 311,
                          child: Text(
                            'Additional notes (optional)',
                            style: TextStyle(
                              color: Color(0xFF374151),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 11),
                        TextField(
                          controller: controller.notesController,
                          maxLines: 3,
                          style: const TextStyle(
                            color: Color(0xFF575757),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            hintText:
                                'Any other thoughts about today\'s session...',
                            hintStyle: TextStyle(
                              color: const Color(0xFF575757).withAlpha(128),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                            contentPadding: const EdgeInsets.all(10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xFFE0E0E0),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xFF012355),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
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

  Widget _buildSliderSection(
    String label,
    RxDouble value,
    String lowLabel,
    String highLabel,
  ) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Obx(
                    () => Text(
                      value.value.toInt().toString(),
                      style: const TextStyle(
                        color: Color(0xFF202020),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Obx(
            () => SliderTheme(
              data: SliderTheme.of(Get.context!).copyWith(
                activeTrackColor: const Color(0xFF012355),
                inactiveTrackColor: const Color(0xFFE0E0E0),
                thumbColor: const Color(0xFF012355),
                overlayColor: const Color(0xFF012355).withAlpha(128),
                trackHeight: 2.0,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 6.0,
                ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                lowLabel,
                style: const TextStyle(
                  color: Color(0xFF575757),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                highLabel,
                style: const TextStyle(
                  color: Color(0xFF575757),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
