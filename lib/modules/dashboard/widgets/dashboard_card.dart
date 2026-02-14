import 'package:flutter/material.dart';
import '../../../../core/utils/size_utils.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback onTap;
  final bool isHighlighted;
  final bool showAction;

  const DashboardCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.isHighlighted = false,
    this.showAction = true,
    this.backgroundColor,
    this.textColor,
    this.iconSize,
  });

  final Color? backgroundColor;
  final Color? textColor;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 104.h,
      decoration: isHighlighted
          ? BoxDecoration(borderRadius: BorderRadius.circular(16.w))
          : null,
      child: Container(
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.w)),
        child: Material(
          color: backgroundColor ?? const Color(0xFF012356),
          borderRadius: BorderRadius.circular(12.w),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: showAction ? null : onTap,
            borderRadius: BorderRadius.circular(12.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon
                if (showAction) ...[
                  SizedBox(
                    height: iconSize ?? 24.h,
                    width: iconSize ?? 24.w,
                    child: icon,
                  ),
                  SizedBox(height: 2.h),
                  // Title
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor ?? const Color(0xFFFFFFFF),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                ] else ...[
                  // Centered layout for cards without action bar
                  SizedBox(
                    height: iconSize ?? 24.h,
                    width: iconSize ?? 24.w,
                    child: icon,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],

                // Bottom "Select to use" area
                if (showAction)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 2.h,
                    ),
                    child: Material(
                      color: const Color(0xFFEFEFEF),
                      borderRadius: BorderRadius.circular(8.w),
                      child: InkWell(
                        onTap: onTap,
                        borderRadius: BorderRadius.circular(8.w),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 4.h,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Select to use",
                                style: TextStyle(
                                  color: const Color(0xFF031945),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.chevron_right,
                                color: const Color(0xFF031945),
                                size: 16.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
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
