import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionCardIcon extends StatelessWidget {
  final String iconPath;
  final bool isPremium;

  const ActionCardIcon({
    super.key,
    required this.iconPath,
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
          SvgPicture.asset("assets/icons/Container.svg", fit: BoxFit.fill),
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
                      ), // Gold for premium, grey-blue for others
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
