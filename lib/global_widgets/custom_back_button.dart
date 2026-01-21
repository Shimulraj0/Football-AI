import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import '../core/utils/size_utils.dart';

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
    return Material(
      borderRadius: BorderRadius.circular(50.w),
      child: InkWell(
        borderRadius: BorderRadius.circular(50.w),
        onTap: onPressed ?? () => Get.back(),
        child: Padding(
          padding: EdgeInsets.zero,
          child: SvgPicture.asset(
            'assets/icons/Back.svg',
            colorFilter: iconColor != null
                ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                : null,
            width: 44.w,
            height: 44.h,
          ),
        ),
      ),
    );
  }
}
