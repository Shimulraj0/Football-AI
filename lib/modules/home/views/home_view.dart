import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'coach_ai_view.dart';
import '../../settings/views/settings_view.dart';
import '../../../global_widgets/custom_back_button.dart';

import '../../../core/values/app_colors.dart';

import '../../../core/utils/size_utils.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../billing/views/billing_view.dart';

// ... imports ...

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // For Index 0, we treat BillingView as the "Home" for this persona.
      // BillingView provides its own BaseScaffold, Header, and BottomNavBar logic.
      if (controller.selectedIndex.value == 0) {
        return const BillingView();
      }

      // For other tabs (e.g. Coach AI, Settings), usage existing structure:
      return BaseScaffold(
        backgroundColor: AppColors.background,
        headerHeight: 124.h,
        headerContent: _buildHeaderContent(),
        body: _buildBody(),
      );
    });
  }

  Widget _buildBody() {
    if (controller.selectedIndex.value == 2) {
      return const SettingsView(isEmbedded: true);
    } else if (controller.selectedIndex.value == 1) {
      return const CoachAiView();
    }
    // Fallback or empty if needed, though index 0 is handled above.
    return const SizedBox.shrink();
  }

  Widget _buildHeaderContent() {
    if (controller.selectedIndex.value == 1) {
      return Row(
        children: [
          CustomBackButton(
            onPressed: () => controller.changeTabIndex(0), // Back to Home
            backgroundColor: Colors.white,
            iconColor: const Color(0xFF00204A),
          ),
          Expanded(
            child: Text(
              "Coach AI",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 40.w),
        ],
      );
    } else if (controller.selectedIndex.value == 2) {
      return Row(
        children: [
          CustomBackButton(
            onPressed: () => controller.changeTabIndex(0),
            backgroundColor: Colors.white,
            iconColor: const Color(0xFF00204A),
          ),
          SizedBox(width: 16.w),
          Text(
            "Settings",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color.fromARGB(255, 250, 249, 249),
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
        ],
      );
    }
    return const SizedBox.shrink(); // No default header needed here as index 0 handles itself
  }
}
