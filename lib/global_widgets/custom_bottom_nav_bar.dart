import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFFEFEFE),
        boxShadow: [
          BoxShadow(
            color: Color(0x1E000000),
            blurRadius: 11.60,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNavItem(
                    imagePath: 'assets/images/home.png',
                    label: "Home",
                    isSelected: selectedIndex == 0,
                    onTap: () => onItemTapped(0),
                  ),
                  _buildNavItem(
                    imagePath: 'assets/images/bubble-chat.png',
                    label: "Coach AI",
                    isSelected: selectedIndex == 1,
                    onTap: () => onItemTapped(1),
                  ),
                  _buildNavItem(
                    imagePath: 'assets/images/settings.png',
                    label: "Settings",
                    isSelected: selectedIndex == 2,
                    onTap: () => onItemTapped(2),
                  ),
                ],
              ),
            ),
          ),
          // Home Indicator Area
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Center(
              child: Container(
                width: 100,
                height:
                    5, // Increased height for visibility, snippet said 0.10 stroke width 2.5
                decoration: BoxDecoration(
                  color: const Color(0xFF1F1D1D),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    String? imagePath,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null)
              Image.asset(
                imagePath,
                width: 24,
                height: 24,
                color: isSelected
                    ? const Color(0xFF012355)
                    : const Color(0xFF575757),
              ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected
                    ? const Color(0xFF012355)
                    : const Color(0xFF575757),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 1.50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
