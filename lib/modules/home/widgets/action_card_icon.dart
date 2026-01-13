import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionCardIcon extends StatelessWidget {
  final String? iconPath;
  final IconData? iconData;
  final String? backgroundPath;
  final EdgeInsetsGeometry? iconPadding;
  final bool isPremium;
  final Color? iconColor;

  const ActionCardIcon({
    super.key,
    this.iconPath,
    this.iconData,
    this.backgroundPath,
    this.iconPadding,
    this.isPremium = false,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 56,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (backgroundPath != null)
            SvgPicture.asset(backgroundPath!)
          else
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FA), // Light background for icon
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Padding(
                  padding: iconPadding ?? EdgeInsets.zero,
                  child: iconData != null
                      ? Icon(
                          iconData,
                          size: 28, // Slightly smaller to fit in box
                          color:
                              iconColor ??
                              (isPremium
                                  ? const Color(0xFFF1C40F)
                                  : const Color(0xFF00204A)),
                        )
                      : iconPath != null
                      ? (iconPath!.endsWith('.svg')
                            ? SvgPicture.asset(
                                iconPath!,
                                width: 28,
                                height: 28,
                                colorFilter: iconColor != null
                                    ? ColorFilter.mode(
                                        iconColor!,
                                        BlendMode.srcIn,
                                      )
                                    : null,
                              )
                            : Image.asset(iconPath!, width: 28, height: 28))
                      : const SizedBox(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
