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
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
    );
  }

  Widget _buildNavItem({
    IconData? iconData,
    String? imagePath,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (iconData != null)
              Icon(
                iconData,
                color: isSelected ? const Color(0xFF00204A) : Colors.grey,
                size: 24,
              )
            else if (imagePath != null)
              Image.asset(imagePath, width: 24, height: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? const Color(0xFF00204A) : Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
