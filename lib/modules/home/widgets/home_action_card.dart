import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconPath; // SVG Asset path or use IconData if preferred
  final bool isPremium;
  final VoidCallback onTap;

  const HomeActionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.onTap,
    this.isPremium = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isPremium ? const Color(0xFF00204A) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: isPremium
            ? null
            : Border.all(
                color: const Color(0xFF2C3E50).withOpacity(0.1),
              ), // Subtle border
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.05),
            offset: const Offset(0, 4),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Icon Box
                // Icon Box
                SizedBox(
                  width: 56,
                  height: 56,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Background
                      SvgPicture.asset(
                        "assets/icons/Container.svg",
                        fit: BoxFit.fill,
                      ),
                      // Icon
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          iconPath,
                          colorFilter: ColorFilter.mode(
                            isPremium
                                ? const Color(0xFFF1C40F)
                                : const Color(
                                    0xFF5D6D7E,
                                  ), // Gold for premium icon, greyish blue for others
                            BlendMode.srcIn,
                          ),
                          placeholderBuilder: (context) => Icon(
                            Icons.grid_view_rounded,
                            color: isPremium
                                ? const Color(0xFFF1C40F)
                                : const Color(0xFF5D6D7E),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),

                // Text Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isPremium
                              ? const Color(0xFFF1C40F)
                              : const Color(0xFF00204A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 13,
                          color: isPremium
                              ? Colors.white.withOpacity(0.8)
                              : const Color(0xFF00204A).withOpacity(0.7),
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
