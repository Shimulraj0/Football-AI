import 'package:flutter/material.dart';
import 'action_card_icon.dart';
import '../../../../core/values/app_padding.dart';
import '../../../../core/utils/size_utils.dart';

class HomeActionCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String? iconPath; // SVG Asset path
  final IconData? iconData; // Material Icon
  final String? backgroundIconPath;
  final EdgeInsetsGeometry? iconPadding;
  final bool isPremium;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Gradient? backgroundGradient;
  final Color? titleColor;
  final Color? subtitleColor;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final Color? borderColor;

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
    this.backgroundColor,
    this.backgroundGradient,
    this.titleColor,
    this.subtitleColor,
    this.iconColor,
    this.iconBackgroundColor,
    this.borderColor,
  });

  @override
  State<HomeActionCard> createState() => _HomeActionCardState();
}

class _HomeActionCardState extends State<HomeActionCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      constraints: BoxConstraints(minHeight: widget.isPremium ? 100.h : 72.h),
      decoration: BoxDecoration(
        color: widget.backgroundGradient == null
            ? (widget.backgroundColor ??
                  (widget.isPremium ? const Color(0xFF00204A) : Colors.white))
            : null,
        gradient: widget.backgroundGradient,
        borderRadius: BorderRadius.circular(16.w),
        border:
            (widget.isPremium ||
                _isPressed ||
                widget.backgroundGradient != null)
            ? null
            : Border.all(color: const Color(0xFF012356)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withValues(alpha: 0.1),
            offset: Offset(0, 4.h),
            blurRadius: 15.w,
            spreadRadius: 2.w,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16.w),
        child: InkWell(
          onTap: widget.onTap,
          onHighlightChanged: (value) {
            setState(() {
              _isPressed = value;
            });
          },
          borderRadius: BorderRadius.circular(16.w),
          child: Padding(
            padding: widget.isPremium
                ? AppPadding
                      .cardPadding // Assuming AppPadding will be updated or is okay for now
                : EdgeInsets.all(8.w),
            child: Row(
              children: [
                // Icon Box
                ActionCardIcon(
                  iconPath: widget.iconPath,
                  iconData: widget.iconData,
                  backgroundPath: widget.backgroundIconPath,
                  iconPadding: widget.iconPadding,
                  isPremium: widget.isPremium,
                  iconColor: widget.iconColor,
                  iconBackgroundColor: widget.iconBackgroundColor,
                ),
                SizedBox(width: 16.w),

                // Text Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color:
                              widget.titleColor ??
                              (widget.isPremium
                                  ? const Color(0xFFF1C40F)
                                  : const Color(0xFF00204A)),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        widget.subtitle,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color:
                              widget.subtitleColor ??
                              (widget.isPremium
                                  ? Colors.white.withValues(alpha: 0.9)
                                  : const Color(
                                      0xFF00204A,
                                    ).withValues(alpha: 0.7)),
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
