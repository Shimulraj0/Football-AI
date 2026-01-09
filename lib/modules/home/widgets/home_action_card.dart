import 'package:flutter/material.dart';
import 'action_card_icon.dart';

class HomeActionCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String? iconPath; // SVG Asset path
  final IconData? iconData; // Material Icon
  final String? backgroundIconPath;
  final EdgeInsetsGeometry? iconPadding;
  final bool isPremium;
  final VoidCallback onTap;

  const HomeActionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.iconPath,
    this.iconData,
    this.backgroundIconPath,
    this.iconPadding,
    this.isPremium = false,
  });

  @override
  State<HomeActionCard> createState() => _HomeActionCardState();
}

class _HomeActionCardState extends State<HomeActionCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: widget.isPremium ? const Color(0xFF00204A) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: (widget.isPremium || _isPressed)
            ? null
            : Border.all(color: const Color(0xFF012356)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withValues(alpha: 0.05),
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
          onTap: widget.onTap,
          onHighlightChanged: (value) {
            setState(() {
              _isPressed = value;
            });
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Icon Box
                ActionCardIcon(
                  iconPath: widget.iconPath,
                  iconData: widget.iconData,
                  backgroundPath: widget.backgroundIconPath,
                  iconPadding: widget.iconPadding,
                  isPremium: widget.isPremium,
                ),
                const SizedBox(width: 16),

                // Text Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: widget.isPremium
                              ? const Color(0xFFF1C40F)
                              : const Color(0xFF00204A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.subtitle,
                        style: TextStyle(
                          fontSize: 13,
                          color: widget.isPremium
                              ? Colors.white.withValues(alpha: 0.8)
                              : const Color(0xFF00204A).withValues(alpha: 0.7),
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
