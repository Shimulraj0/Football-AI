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
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    // If we want the content to be safe, we need to add padding.
    // If we want the background to extend, we need to add height.
    // The 'height' passed in is likely the design height (content + internal padding).
    // So we should add statusBarHeight to the total container height
    // and add statusBarHeight to the top padding.

    return Container(
      height: height + statusBarHeight,
      // Add status bar height to the top padding, ensuring we preserve existing padding if any
      padding: padding != null
          ? padding!.add(EdgeInsets.only(top: statusBarHeight))
          : EdgeInsets.only(top: statusBarHeight),
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
