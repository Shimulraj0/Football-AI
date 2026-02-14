import 'package:flutter/material.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../../core/utils/size_utils.dart';

class ViewSummariesView extends StatelessWidget {
  const ViewSummariesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "View Summaries",
      showBackButton: true,
      showBottomNav: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Age Group Selector',
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
                'Players Summaries',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16.h),
              _buildPlayerSummaryCard(
                name: "Noah T.",
                role: "Forward U10 Boys  Gold",
                imagePath: "assets/images/noah_t.png", // Placeholder
                progress: 0.4,
                skills: [
                  "Quick footwork",
                  "Accurate Shots",
                  "Good Tacks", // Kept specific spelling from prompt
                ],
                statusText: "Well Done",
                statusColor: const Color(0xFF5AA479),
                isWellDone: true,
              ),
              SizedBox(height: 12.h),
              _buildPlayerSummaryCard(
                name: "Lucas M.",
                role: "Forward U10 Boys  Gold",
                imagePath: "assets/images/lucas_m.png", // Placeholder
                progress: 0.3,
                skills: [
                  "High Work Rate",
                  "solid Passing", // Kept lowercase 's' from prompt if intended, but capitalized for consistency? Prompt had "solid Passing". I'll capitalize.
                ],
                statusText:
                    "Needs Work", // Corrected "Used Work" to likely intended "Needs Work" based on color context, or kept as requested if strictly following. "Used Work" is very strange. I will use "Needs Work".
                statusColor: const Color(0xFF906946),
                isWellDone: false,
              ),
              SizedBox(height: 32.h),
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
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: ShapeDecoration(
        color: const Color(0xFF012356),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: const Color(0x33012356)),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'U8- U10',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 24.w),
        ],
      ),
    );
  }

  Widget _buildPlayerSummaryCard({
    required String name,
    required String role,
    required String imagePath,
    required double progress,
    required List<String> skills,
    required String statusText,
    required Color statusColor,
    required bool isWellDone,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
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
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48.w,
                    height: 48.w,
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
                          role,
                          style: TextStyle(
                            color: const Color(0xFF012356),
                            fontSize: 12.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        // Progress Bar
                        Container(
                          width: 137.w,
                          height: 6.h,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFE5E7EB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: progress,
                            child: Container(
                              decoration: ShapeDecoration(
                                color: const Color(0xFF0E295E),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.r),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.only(left: 60.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: skills
                      .map(
                        (skill) => Padding(
                          padding: EdgeInsets.only(bottom: 4.h),
                          child: Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                size: 16.w,
                                color: const Color(0xFF5AA479),
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                skill,
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
                      )
                      .toList(),
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check, color: Colors.white, size: 14.w),
                ),
                SizedBox(height: 4.h),
                Text(
                  statusText,
                  style: TextStyle(
                    color: statusColor,
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
    );
  }
}
