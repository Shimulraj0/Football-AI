import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/utils/size_utils.dart';
import '../routes/app_routes.dart';

class CoachFloatingButton extends StatelessWidget {
  const CoachFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          AppRoutes.aiCommunication,
          arguments: {'title': 'Coach AI', 'mode': 'coach_message'},
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.h, right: 20.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 160.w,
              padding: EdgeInsets.all(12.w),
              decoration: ShapeDecoration(
                color: const Color(0xFF40D0BC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 146.w,
                    child: Text(
                      'Wanted to know how you child doing? message the coach',
                      style: TextStyle(
                        color: const Color(0xFF012356),
                        fontSize: 8.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 1.50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 42.36.w,
                  height: 42.87.w,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 3.34.h,
                        child: Container(
                          width: 35.62.w,
                          height: 35.62.w,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF012356),
                            shape: OvalBorder(),
                          ),
                          child: Center(
                            child: Text(
                              'Coach',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
