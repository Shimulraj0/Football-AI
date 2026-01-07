import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? iconColor;

  const CustomBackButton({
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            backgroundColor ?? const Color(0xFFF5F7FA), // Light grey background
        shape: BoxShape.circle, // Circular shape
      ),
      child: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/Back.svg',
          colorFilter: iconColor != null
              ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
              : null,
        ),
        onPressed: onPressed ?? () => Get.back(),
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        style: IconButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
    );
  }
}
