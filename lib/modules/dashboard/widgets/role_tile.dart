import 'package:flutter/material.dart';

class RoleTile extends StatelessWidget {
  final String title;
  final String assetPath;
  final bool isSelected;
  final VoidCallback onTap;

  const RoleTile({
    super.key,
    required this.title,
    required this.assetPath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF00204A)
              : const Color(0xFFEAF2F8), // Dark Blue vs Light Blue
          borderRadius: BorderRadius.circular(16),
          border: isSelected
              ? null
              : Border.all(color: const Color(0xFF2C5FA8), width: 1.5),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                assetPath,
                width: 20, // Icon width from original code
                height: 20, // Icon height from original code
                color: isSelected ? Colors.white : const Color(0xFF00204A),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : const Color(0xFF00204A),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
