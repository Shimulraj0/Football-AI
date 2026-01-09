import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/settings_controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../../global_widgets/custom_back_button.dart';
import '../../../../core/values/app_padding.dart';
import '../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../home/controllers/home_controller.dart';
import '../../../core/values/app_colors.dart';

class SettingsView extends GetView<SettingsController> {
  final bool isEmbedded;
  const SettingsView({super.key, this.isEmbedded = false});

  @override
  Widget build(BuildContext context) {
    if (isEmbedded) {
      return _buildSettingsContent();
    }
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // Header
          Container(
            height: 160,
            padding: AppPadding.headerPadding,
            decoration: const BoxDecoration(
              color: Color(0xFF00204A),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Row(
                children: [
                  const CustomBackButton(
                    backgroundColor: Colors.white,
                    iconColor: Color(0xFF00204A),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "Coach AI",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),

          Expanded(child: _buildSettingsContent()),
        ],
      ),
      bottomNavigationBar: () {
        if (Get.isRegistered<HomeController>()) {
          final homeController = Get.find<HomeController>();
          return Obx(
            () => CustomBottomNavBar(
              selectedIndex: homeController.selectedIndex.value,
              onItemTapped: homeController.changeTabIndex,
            ),
          );
        } else {
          return null;
        }
      }(),
    );
  }

  Widget _buildSettingsContent() {
    return ListView(
      padding: AppPadding.pagePadding,
      children: [
        _buildSectionTitle("Profile Settings"),
        _buildListTile(
          icon: Icons.person_outline,
          title: "Profile",
          onTap: () => Get.toNamed(AppRoutes.editProfile),
        ),
        const SizedBox(height: 10),
        _buildListTile(
          icon: Icons.lock_outline,
          title: "Password Change",
          onTap: () => Get.toNamed(AppRoutes.changePassword),
        ),
        const SizedBox(height: 20),

        _buildSectionTitle("Notifications Settings"),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFE0F2F1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.notifications_outlined,
                color: Color(0xFF00204A),
                size: 20,
              ),
            ),
            title: const Text(
              "Push Notifications",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF00204A),
              ),
            ),
            trailing: Obx(
              () => Switch(
                value: controller.isPushNotificationsEnabled.value,
                onChanged: controller.togglePushNotifications,
                activeThumbColor: const Color(0xFF012356),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),

        _buildSectionTitle("Help & Support"),
        _buildListTile(
          icon: Icons.help_outline,
          title: "FAQs",
          onTap: () => Get.toNamed(AppRoutes.faq),
        ),
        const SizedBox(height: 10),
        _buildListTile(
          icon: Icons.headset_mic_outlined,
          title: "Contact Support",
          onTap: () => Get.toNamed(AppRoutes.contactSupport),
        ),
        const SizedBox(height: 10),
        _buildListTile(
          icon: Icons.privacy_tip_outlined,
          title: "Privacy Policy",
          onTap: () => Get.toNamed(AppRoutes.privacyPolicy),
        ),
        const SizedBox(height: 10),
        _buildListTile(
          icon: Icons.description_outlined,
          title: "Terms & Condition",
          onTap: () => Get.toNamed(AppRoutes.termsCondition),
        ),
        const SizedBox(height: 30),

        ElevatedButton(
          onPressed: controller.logout,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00204A),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            "Logout",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF00204A),
        ),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFEEF5FF),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFF00204A), size: 20),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF00204A),
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
      ),
    );
  }
}
