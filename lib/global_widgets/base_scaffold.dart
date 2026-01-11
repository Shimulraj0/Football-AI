import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/app_colors.dart';
import 'custom_back_button.dart';
import 'persistent_header.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final String? title;
  final Widget? headerContent;
  final Widget? bottomNavigationBar;
  final Color backgroundColor;
  final bool showBackButton;
  final VoidCallback? onBackPress;

  const BaseScaffold({
    super.key,
    required this.body,
    this.title,
    this.headerContent,
    this.bottomNavigationBar,
    this.backgroundColor = AppColors.background,
    this.showBackButton = true,
    this.onBackPress,
  });

  @override
  Widget build(BuildContext context) {
    // Check if keyboard is open
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          // Persistent Header
          PersistentHeader(child: headerContent ?? _buildDefaultHeader()),

          // Main Content
          Expanded(child: body),
        ],
      ),
      // Hide bottom nav bar when keyboard is open to prevent "big space"
      bottomNavigationBar: isKeyboardOpen ? null : bottomNavigationBar,
    );
  }

  Widget _buildDefaultHeader() {
    return Row(
      children: [
        if (showBackButton)
          CustomBackButton(
            onPressed: onBackPress ?? () => Get.back(),
            backgroundColor: Colors.white,
            iconColor: const Color(0xFF00204A),
          ),
        if (title != null) ...[
          if (showBackButton) const SizedBox(width: 16),
          Expanded(
            child: Text(
              title!,
              textAlign: showBackButton ? TextAlign.left : TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (showBackButton) const SizedBox(width: 40), // Balance back button
        ],
      ],
    );
  }
}
