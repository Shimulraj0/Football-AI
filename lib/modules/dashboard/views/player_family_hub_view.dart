import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_back_button.dart';
import '../controllers/dashboard_controller.dart';

class PlayerFamilyHubView extends GetView<DashboardController> {
  const PlayerFamilyHubView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                  children: [
                    const CustomBackButton(),
                    const Spacer(),
                    const Text(
                      'Player & Family Hub',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(width: 40), // Balance back button
                  ],
                ),
              ),

              // Selection Cards
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: _buildSelectionCard(
                        title: 'Parent',
                        iconPath: 'assets/icons/ic_single_role.png',
                        isSelected:
                            controller.familyHubSelection.value == 'Parent',
                        isDark: controller.familyHubSelection.value == 'Parent',
                        onTap: () => controller.selectFamilyHubRole('Parent'),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildSelectionCard(
                        title: 'Player',
                        iconPath: 'assets/icons/ic_single_role.png',
                        isSelected:
                            controller.familyHubSelection.value == 'Player',
                        isDark: controller.familyHubSelection.value == 'Player',
                        onTap: () => controller.selectFamilyHubRole('Player'),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: controller.proceedToAuthFromHub,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectionCard({
    required String title,
    required String iconPath,
    required VoidCallback onTap,
    bool isSelected = false,
    bool isDark = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF0A2558) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF0A2558), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDark ? Colors.white : const Color(0xFF0A2558),
                  width: 1.5,
                ),
              ),
              child: Image.asset(
                iconPath,
                width: 24,
                height: 24,
                color: isDark ? Colors.white : const Color(0xFF0A2558),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : const Color(0xFF0A2558),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
