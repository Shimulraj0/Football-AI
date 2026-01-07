import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionCardIcon extends StatelessWidget {
  final String iconPath;
  final String? backgroundPath;
  final EdgeInsetsGeometry? iconPadding;
  final bool isPremium;

  const ActionCardIcon({
    super.key,
    required this.iconPath,
    this.backgroundPath,
    this.iconPadding,
    this.isPremium = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 56,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (backgroundPath != null) SvgPicture.asset(backgroundPath!),
          Padding(
            padding: iconPadding ?? EdgeInsets.zero,
            child: SvgPicture.asset(
              iconPath,
              colorFilter: isPremium
                  ? const ColorFilter.mode(Color(0xFFF1C40F), BlendMode.srcIn)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
