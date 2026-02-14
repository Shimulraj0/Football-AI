import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../../core/utils/size_utils.dart';
import '../controllers/evaluation_controller.dart';

class EvaluationEntryView extends GetView<EvaluationController> {
  const EvaluationEntryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "Evaluation Entry",
      showBackButton: true,
      showBottomNav: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPlayerInfoCard(),
              SizedBox(height: 24.h),
              Text(
                'Rate Player',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16.h),
              Obx(
                () => Column(
                  children: [
                    _buildRatingCard(
                      "Handeling",
                      "${controller.ageGroup.value} - Evaluation",
                      controller.headCoach.value,
                      controller.skillRatings["Handeling"] ?? 0,
                    ),
                    SizedBox(height: 12.h),
                    _buildRatingCard(
                      "Footwork",
                      "${controller.ageGroup.value} - Evaluation",
                      controller.headCoach.value,
                      controller.skillRatings["Footwork"] ?? 0,
                    ),
                    SizedBox(height: 12.h),
                    _buildRatingCard(
                      "Positioning",
                      "${controller.ageGroup.value} - Evaluation",
                      controller.headCoach.value,
                      controller.skillRatings["Positioning"] ?? 0,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              _buildNotesSection(),
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
                      onTap: () => controller.saveEvaluation(),
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

  Widget _buildPlayerInfoCard() {
    return Obx(
      () => Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.w),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(controller.imagePath.value),
                      fit: BoxFit.cover,
                      onError: (exception, stackTrace) =>
                          const Icon(Icons.person),
                    ),
                    color: Colors.grey[300],
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.playerName.value,
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
                      '${controller.ageGroup.value} - Due ${controller.dueDate.value}',
                      style: TextStyle(
                        color: const Color(0xFF012356),
                        fontSize: 12.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Head Coach: ${controller.headCoach.value}',
                      style: TextStyle(
                        color: const Color(0xFF012356),
                        fontSize: 12.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.chevron_right,
              color: const Color(0xFF012356),
              size: 24.w,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingCard(
    String title,
    String subtitle,
    String coach,
    int value,
  ) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          SizedBox(height: 4.h),
          Text(
            coach,
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 12.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$value',
                style: TextStyle(
                  color: value > 0
                      ? const Color(0xFF55A97E)
                      : const Color(0xFFAE4D3D),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '10',
                style: TextStyle(
                  color: const Color(0xFFBDBDBD),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          LayoutBuilder(
            builder: (context, constraints) {
              return GestureDetector(
                onHorizontalDragUpdate: (details) {
                  _handleTouch(
                    details.localPosition,
                    title,
                    constraints.maxWidth,
                  );
                },
                onTapDown: (details) {
                  _handleTouch(
                    details.localPosition,
                    title,
                    constraints.maxWidth,
                  );
                },
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 12.h,
                      color: Colors.transparent, // Touch area
                      alignment: Alignment.center,
                      child: Container(
                        width: double.infinity,
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE1E1E1),
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: (value / 10).clamp(0.0, 1.0),
                        child: Container(
                          height: 4.h,
                          margin: EdgeInsets.symmetric(vertical: 4.h),
                          decoration: BoxDecoration(
                            color: value > 0
                                ? const Color(0xFF55A97E)
                                : const Color(0xFFAE4D3D),
                            borderRadius: BorderRadius.circular(2.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _handleTouch(Offset localPosition, String skill, double maxWidth) {
    double p = (localPosition.dx / maxWidth).clamp(0.0, 1.0);
    int newValue = (p * 10).round();
    controller.updateRating(skill, newValue);
  }

  Widget _buildNotesSection() {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.chat_bubble_outline,
                color: const Color(0xFF012356),
                size: 24.w,
              ),
              SizedBox(width: 8.w),
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
          TextField(
            controller: controller.coachNotesController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'write notes about the player',
              hintStyle: TextStyle(
                color: const Color(0xFFBDBDBD),
                fontSize: 12.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: Color(0xFF3064AB)),
              ),
              contentPadding: EdgeInsets.all(12.w),
            ),
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 12.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
