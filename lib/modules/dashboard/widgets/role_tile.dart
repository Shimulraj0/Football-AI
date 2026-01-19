import 'package:flutter/material.dart';

class RoleTile extends StatelessWidget {
  final String title;
  final String assetPath;
  final IconData? icon;
  final bool isFeatured;
  final bool isSelected;
  final VoidCallback onTap;

  const RoleTile({
    super.key,
    required this.title,
    required this.assetPath,
    this.icon,
    this.isFeatured = false,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Featured (Club Setup) styling overrides
    final backgroundColor = isFeatured
        ? const Color(0xFF00204A)
        : (isSelected ? const Color(0xFF00204A) : Colors.white);

    final borderColor = isFeatured
        ? null
        : (isSelected
              ? null
              : Border.all(color: const Color(0xFF2C5FA8), width: 1.5));

    final textColor = isFeatured
        ? Colors.white
        : (isSelected ? Colors.white : const Color(0xFF00204A));

    final iconColor = isFeatured
        ? Colors.white
        : (isSelected ? Colors.white : const Color(0xFF00204A));

    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: borderColor,
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: isFeatured
                      ? BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        )
                      : null,
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: isFeatured ? 32 : 24,
                  ),
                )
              else
                Image.asset(assetPath, width: 20, height: 20, color: iconColor),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isFeatured ? 13 : 14,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
