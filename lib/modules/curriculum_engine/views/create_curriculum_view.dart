import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/curriculum_engine_controller.dart';

class CreateCurriculumView extends GetView<CurriculumEngineController> {
  const CreateCurriculumView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              _buildHeader(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListView(
                    children: [
                      const SizedBox(height: 20),
                      _buildStepper(),
                      const SizedBox(height: 20),
                      Obx(
                        () => controller.currentStep.value == 1
                            ? _buildStep1()
                            : _buildStep2(),
                      ),
                      const SizedBox(height: 80), // Space for bottom
                    ],
                  ),
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
            onTap: () {
              // If on step 2, back to step 1? Or global back?
              // Visual implies global back, but UX might suggest step back.
              // For now, global back as per "back button" icon convention.
              // Wait, if I'm on step 2, maybe I should go back to step 1?
              // I'll make it global back for now, can refine if needed.
              Get.back();
            },
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
                "Create Curriculum",
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

  Widget _buildStepper() {
    return Obx(() {
      final isStep2 = controller.currentStep.value == 2;
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Stage 1 Circle
          _buildStepCircle("Stage: 1", true),
          // Connector
          Expanded(child: Container(height: 4, color: const Color(0xFF2C5FA8))),
          // Stage 2 Circle
          _buildStepCircle("Stage: 2", isStep2),
        ],
      );
    });
  }

  Widget _buildStepCircle(String text, bool isActive) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isActive
            ? const Color(0xFF002CDA)
            : Colors.grey.withValues(alpha: 0.5), // Bright blue for active
        shape: BoxShape.circle,
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }

  Widget _buildStep1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Step: 1 ( Age-Group )",
              style: TextStyle(
                color: Color(0xFF00204A),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () => controller.setStep(2), // NEXT
              child: Container(
                // Temporary Next Button for verify flow
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF00204A),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          "Select your age group",
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        const SizedBox(height: 16),
        ...controller.ageGroups.map((group) {
          return Obx(
            () => _buildRadioOption(
              label: group,
              isSelected: controller.selectedAgeGroup.value == group,
              onTap: () => controller.selectAgeGroup(group),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildStep2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Step: 2 ( Frequency + Pillars )",
              style: TextStyle(
                color: Color(0xFF00204A),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () => controller.setStep(1), // BACK to 1
              child: Container(
                // Temporary Back Button for verify flow
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  "Back",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          "Training Frequency",
          style: TextStyle(
            color: Color(0xFF00204A),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFF8F9FB),
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: controller.decrementFrequency,
                icon: const Icon(Icons.remove),
              ),
              Obx(
                () => Text(
                  "${controller.trainingFrequencyWeeks.value}\nWeeks",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF0055FF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: controller.incrementFrequency,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          "Focus Areas",
          style: TextStyle(
            color: Color(0xFF00204A),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        ...controller.focusAreas.map((area) {
          return Obx(
            () => _buildCheckboxOption(
              label: area,
              isSelected: controller.selectedFocusAreas.contains(area),
              onTap: () => controller.toggleFocusArea(area),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildRadioOption({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF0055FF)
                      : Colors.grey.shade300,
                  width: 2,
                ),
              ),
              padding: const EdgeInsets.all(3),
              child: isSelected
                  ? Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF0055FF),
                        shape: BoxShape.circle,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? const Color(0xFF0055FF) : Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxOption({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: isSelected
                    ? const Color(0xFF0055FF)
                    : Colors.transparent,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF0055FF)
                      : Colors.grey.shade300,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? const Color(0xFF0055FF) : Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
