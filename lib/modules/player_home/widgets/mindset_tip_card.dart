import 'package:flutter/material.dart';
import '../../../../core/utils/size_utils.dart';

class MindsetTipCard extends StatelessWidget {
  const MindsetTipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      padding: EdgeInsets.all(12.w),
      decoration: ShapeDecoration(
        color: const Color(0xFF40D0BC),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 32.w,
                height: 32.w,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: Stack(
                  children: [
                    Icon(
                      Icons.auto_awesome_outlined,
                      color: Colors.white,
                      size: 24.w,
                    ), // Placeholder icon
                  ],
                ),
              ),
              SizedBox(width: 9.w),
              Text(
                'Daily Mindset Tip',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 1.50,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Container(
            width: double.infinity,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  // Added Expanded to handle text wrapping if needed, though design snippet uses fixed width behavior implicitly
                  child: Text(
                    'The harder you work, the luckier you get.',
                    textAlign: TextAlign.center, // Snippet has center
                    style: TextStyle(
                      color: const Color(0xFFFEFEFE),
                      fontSize: 14.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
