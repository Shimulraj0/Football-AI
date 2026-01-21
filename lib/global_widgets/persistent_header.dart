import 'package:flutter/material.dart';
import '../core/utils/size_utils.dart';

class PersistentHeader extends StatelessWidget {
  final Widget? child;
  final double height;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;

  const PersistentHeader({
    super.key,
    this.child,
    this.height = 140,
    this.backgroundColor = const Color(0xFF012355),
    this.padding,
  });

  // ... existing code ...

  factory PersistentHeader.welcome({
    required String title,
    required String subtitle,
  }) {
    // ... existing implementation ...
    return PersistentHeader(
      height: 180.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          height, // Height is already scaled if passed via welcome(), defaulting in constructor might need scaling too.
      // Wait, default value in constructor '140' isn't scaled.
      // I should scale usage or default value.
      // best practice: scale in constructor or getter?
      // Since it's a const constructor, I can't do .h there.
      // I'll leave parameter as is and scale in build? Or require callers to scale?
      // Given usage in BaseScaffold is `PersistentHeader(child: ...)` using default 140.
      // I should probably scale the container height in build if it wasn't scaled.
      // But 'height' parameter is double.
      // Let's assume callers provide scaled values or I scale in build if it looks like a raw pixel value? No that's risky.
      // Let's look at BaseScaffold usage: `PersistentHeader(child: headerContent ?? _buildDefaultHeader())`. It uses default 140.
      // So I should change BaseScaffold to pass a scaled height or change PersistentHeader default.
      // I can't change default in const constructor to .h.
      // I will update BaseScaffold to pass scaled height, and here I will just use `height`.
      // BUT `PersistentHeader.welcome` factory CAN use .h.
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.w),
          bottomRight: Radius.circular(32.w),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1E000000),
            blurRadius: 10.w,
            offset: Offset(0, 4.h),
            spreadRadius: 0,
          ),
        ],
      ),
      child: child,
    );
  }
}
