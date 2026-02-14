import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../../core/utils/size_utils.dart';
import '../../../routes/app_routes.dart';

class EvaluatedPlayersView extends StatelessWidget {
  const EvaluatedPlayersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title:
          "Player Evaluated", // Using 'title' for the transparent header style
      showBackButton: true,
      showBottomNav: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Evaluated Players',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16.h),
              _buildPlayerCard(
                name: "Ethan J.",
                score: 16,
                lastEval: "Last Ev. Dec 12",
                scoreColor: const Color(0xFF55A97E),
                imagePath: "assets/images/ethan_j.png",
              ),
              SizedBox(height: 12.h),
              _buildPlayerCard(
                name: "Jacob P.",
                score: 15,
                lastEval: "Last Ev. Dec 12",
                scoreColor: const Color(0xFF55A97E),
                imagePath: "assets/images/jacob_p.png",
              ),
              SizedBox(height: 12.h),
              _buildPlayerCard(
                name: "Noah W.",
                score: 12,
                lastEval: "Last Ev. Dec 12",
                scoreColor: const Color(0xFFE68B34),
                imagePath: "assets/images/noah_w.png",
              ),
              SizedBox(height: 12.h),
              _buildPlayerCard(
                name: "Mateo R.",
                score: 10,
                lastEval: "Last Ev. Dec 12",
                scoreColor: const Color(0xFFE68B34),
                imagePath: "assets/images/mateo_r.png",
              ),
              SizedBox(height: 32.h),
              Center(
                child: Container(
                  width: 249.w,
                  height: 44.h, // Approx height based on padding
                  decoration: BoxDecoration(
                    color: const Color(0xFF3064AB),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.evaluationSummary);
                      },
                      borderRadius: BorderRadius.circular(8.r),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'View Evaluation Summary',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.white,
                              size: 24.w,
                            ),
                          ],
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

  Widget _buildPlayerCard({
    required String name,
    required int score,
    required String lastEval,
    required Color scoreColor,
    required String imagePath,
  }) {
    return Container(
      width: double.infinity,
      height: 69.h,
      padding: EdgeInsets.all(12.w), // Padding to match visual
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 36.w,
                    height: 36.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 16.w,
                      height: 16.w,
                      decoration: const BoxDecoration(
                        color: Color(0xFF55A97E), // Green checkmark bg
                        shape: BoxShape.circle,
                        border: Border.fromBorderSide(
                          BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                      child: Icon(Icons.check, size: 10.w, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 8.w), // Spacing
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
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
                  Row(
                    children: [
                      Text(
                        'Overall Score ',
                        style: TextStyle(
                          color: const Color(0xFF012356),
                          fontSize: 12.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '$score',
                        style: TextStyle(
                          color: scoreColor,
                          fontSize: 12.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                lastEval,
                style: TextStyle(
                  color: const Color(0x7F012356),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(
                  color: scoreColor,
                  borderRadius: BorderRadius.circular(18.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  '$score',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
