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
          // Background
          _buildBackground(backgroundPath ?? "assets/images/Container(4).png"),
          Padding(
            padding: iconPadding ?? const EdgeInsets.all(12),
            child: SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                isPremium
                    ? const Color(0xFFF1C40F)
                    : const Color(
                        0xFF5D6D7E,
                      ), // Gold for premium, grey-blue for others
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground(String path) {
    if (path.endsWith('.svg')) {
      return SvgPicture.asset(path, fit: BoxFit.fill);
    } else {
      return Image.asset(path, fit: BoxFit.fill);
    }
  }
}
