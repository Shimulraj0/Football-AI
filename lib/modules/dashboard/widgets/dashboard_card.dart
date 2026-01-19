import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback onTap;
  final bool isHighlighted;
  final bool showAction;

  const DashboardCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.isHighlighted = false,
    this.showAction = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(bottom: 20), // Handled by parent
      decoration: isHighlighted
          ? BoxDecoration(
              border: Border.all(
                color: const Color(
                  0xFF0091FF,
                ), // Bright Blue/Cyan highlight from design
                width: 2,
              ),
              borderRadius: BorderRadius.circular(16),
            )
          : null,
      child: Container(
        padding: const EdgeInsets.all(3), // Border spacing
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Material(
          color: const Color(0xFF031945), // AppColors.primary (Dark Navy)
          borderRadius: BorderRadius.circular(12),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon
              SizedBox(
                height: 36,
                width: 36,
                child: icon,
              ), // Slightly larger for clarity
              const SizedBox(height: 6),
              // Title
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18, // Restored to 18 for better readability
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Bottom "Select to use" area
              IgnorePointer(
                ignoring: !showAction,
                child: Opacity(
                  opacity: showAction ? 1.0 : 0.0,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: onTap,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: double.infinity, // Stretch to full width
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFFEFEFEF,
                          ), // Off-white/Light Grey button bg
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Text(
                              "Select to use",
                              style: TextStyle(
                                color: Color(0xFF031945), // AppColors.primary
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.chevron_right,
                              color: Color(0xFF031945), // AppColors.primary
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
