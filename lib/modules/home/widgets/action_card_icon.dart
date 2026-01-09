import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionCardIcon extends StatelessWidget {
  final String? iconPath;
  final IconData? iconData;
  final String? backgroundPath;
  final EdgeInsetsGeometry? iconPadding;
  final bool isPremium;

  const ActionCardIcon({
    super.key,
    this.iconPath,
    this.iconData,
    this.backgroundPath,
    this.iconPadding,
    this.isPremium = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 56,

      child: Row(
        mainAxisAlignment: .center,
        children: [
          if (backgroundPath != null) SvgPicture.asset(backgroundPath!),
          Padding(
            padding: iconPadding ?? EdgeInsets.zero,
            child: iconData != null
                ? Icon(
                    iconData,
                    size: 40,
                    color: isPremium
                        ? const Color(0xFFF1C40F)
                        : const Color(0xFF00204A),
                  )
                : iconPath != null
                ? (iconPath!.endsWith('.svg')
                      ? SvgPicture.asset(iconPath!, width: 40, height: 40)
                      : Image.asset(iconPath!, width: 40, height: 40))
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
