import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../../core/utils/size_utils.dart';
import '../../../routes/app_routes.dart';

class EvaluationSummaryView extends StatelessWidget {
  const EvaluationSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "Evaluation Summary",
      showBackButton: true,
      showBottomNav: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Teams',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 12.h),
              _buildDropdownSelector(),
              SizedBox(height: 24.h),
              Text(
                'Pending Evaluations',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16.h),
              _buildPlayerCard(
                name: "Landom M.",
                details: "U8 - Evaluation Due May 8",
                subDetails: "U8 Boys Premier",
                coach: "Emily Warner, Head Coach",
                imagePath: "assets/images/landon_m.png",
                dueBadgeText: "Due in 3 Days",
                ageGroup: "U8",
                dueDate: "May 8",
              ),
              SizedBox(height: 12.h),
              _buildPlayerCard(
                name: "Ethan M.",
                details: "U9 - Evaluation Due Dec 19",
                subDetails: "U9 Boys Premier",
                coach: "Sam Cooper, Head Coach",
                imagePath: "assets/images/ethan_m.png",
                dueBadgeText: "Due in 4 Days",
                ageGroup: "U9",
                dueDate: "Dec 19",
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.chat_bubble_outline,
                    color: const Color(0xFF012356),
                    size: 24.w,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    'Coach’s Notes',
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: ShapeDecoration(
                  color: const Color(0xFFFEFEFE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  shadows: [
                    BoxShadow(
                      color: const Color(0x28000000),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Text(
                  'Ethan is quick with his hands but should practice recognizing open spaces sonner. Let’s work on game awareness during practice',
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              Center(
                child: Container(
                  width: 249.w,
                  height: 48.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF3064AB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        // Save action
                      },
                      borderRadius: BorderRadius.circular(8.r),
                      child: Center(
                        child: Text(
                          'Save Evaluation',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownSelector() {
    return Container(
      width: double.infinity,
      height: 38.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'All teams',
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: const Color(0xFF012356),
            size: 24.w,
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerCard({
    required String name,
    required String details,
    required String subDetails,
    required String coach,
    required String imagePath,
    required String dueBadgeText,
    required String ageGroup,
    required String dueDate,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: ShapeDecoration(
        color: const Color(0xFFFEFEFE),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 52.w,
                height: 52.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                    onError: (exception, stackTrace) {},
                  ),
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: const Color(0xFF012356),
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 1.1,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      details,
                      style: TextStyle(
                        color: const Color(0xFF012356),
                        fontSize: 12.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      subDetails,
                      style: TextStyle(
                        color: const Color(0xFF012356),
                        fontSize: 12.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      coach,
                      style: TextStyle(
                        color: const Color(0xFF012356),
                        fontSize: 12.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Align(
            alignment: Alignment.centerRight,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Get.toNamed(
                    AppRoutes.evaluationEntry,
                    arguments: {
                      'name': name,
                      'image': imagePath,
                      'ageGroup': ageGroup,
                      'dueDate': dueDate,
                      'headCoach': coach,
                    },
                  );
                },
                borderRadius: BorderRadius.circular(4.r),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFFE6E2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        dueBadgeText,
                        style: TextStyle(
                          color: const Color(0xFFAE4D3D),
                          fontSize: 12.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.chevron_right,
                        color: const Color(0xFFAE4D3D),
                        size: 16.w,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
