import 'package:flutter/material.dart';
import '../../../../core/utils/size_utils.dart';

class BillingAddOnCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imagePath;
  final IconData? iconData;
  final VoidCallback? onTap;

  const BillingAddOnCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.imagePath,
    this.iconData,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        shadows: [
          BoxShadow(
            color: const Color(0x28000000),
            blurRadius: 6,
            offset: const Offset(0, 3),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 48.w,
                  height: 48.w, // Square dimensions
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF9F9F9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Center(
                    child: imagePath != null
                        ? Image.asset(imagePath!, width: 24.w, height: 24.w)
                        : Icon(
                            iconData ??
                                Icons.add_circle_outline, // Default icon
                            color: const Color(0xFF012356),
                            size: 24.sp,
                          ),
                  ),
                ),
                SizedBox(width: 13.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: const Color(0xFF012356),
                          fontSize: 16.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: const Color(0xFF012356),
                          fontSize: 12.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
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
