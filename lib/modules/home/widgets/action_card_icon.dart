import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/size_utils.dart';

class ActionCardIcon extends StatelessWidget {
  final String? iconPath;
  final IconData? iconData;
  final String? backgroundPath;
  final EdgeInsetsGeometry? iconPadding;
  final bool isPremium;
  final Color? iconColor;
  final Color? iconBackgroundColor;

  const ActionCardIcon({
    super.key,
    this.iconPath,
    this.iconData,
    this.backgroundPath,
    this.iconPadding,
    this.isPremium = false,
    this.iconColor,
    this.iconBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56.w,
      height: 56.h,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (backgroundPath != null)
            SvgPicture.asset(backgroundPath!)
          else
            Container(
              width: 56.w,
              height: 56.h,
              decoration: BoxDecoration(
                color:
                    iconBackgroundColor ??
                    const Color(0xFFEEF5FF), // Custom or Light background
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Center(
                child: Padding(
                  padding: iconPadding ?? EdgeInsets.zero,
                  child: iconData != null
                      ? Icon(
                          iconData,
                          size: 40.sp, // Increased from 28
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
                                width: 40.w, // Increased from 28
                                height: 40.h, // Increased from 28
                                colorFilter: iconColor != null
                                    ? ColorFilter.mode(
                                        iconColor!,
                                        BlendMode.srcIn,
                                      )
                                    : null,
                              )
                            : Image.asset(
                                iconPath!,
                                width: 40.w, // Increased from 28
                                height: 40.h, // Increased from 28
                                color: iconColor,
                                colorBlendMode: iconColor != null
                                    ? BlendMode.srcIn
                                    : null,
                              ))
                      : const SizedBox(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
