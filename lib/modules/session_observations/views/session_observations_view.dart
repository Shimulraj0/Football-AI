import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/custom_back_button.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/session_observations_controller.dart';

class SessionObservationsView extends GetView<SessionObservationsController> {
  const SessionObservationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      headerContent: _buildHeader(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDropdown(),
                  SizedBox(height: 16.h),
                  _buildNeedsObservationBanner(),
                  SizedBox(height: 16.h),
                  _buildAgeGroupCard(
                    title: 'U9 Boys Premier',
                    time: 'Today | 5:00 PM',
                    coach: 'Warner',
                    topic: 'Ball Control',
                    lastObserved: 'Last Observed: April 8',
                    showNeedObservation: true,
                    onActionTap: () {
                      Get.toNamed(AppRoutes.addObservationNotes);
                    },
                    actionLabel: 'Add Note',
                  ),
                  SizedBox(height: 16.h),
                  _buildAgeGroupCard(
                    title: 'U10 Boys Silver',
                    time: 'Thursday | April 25',
                    coach: 'Mayer',
                    topic: 'Defensive Shape',
                    lastObserved: 'Last Observed: April 3',
                    showNeedObservation: true,
                    onActionTap: () {
                      Get.toNamed(AppRoutes.addObservationNotes);
                    },
                    actionLabel: 'Add Note',
                  ),
                  SizedBox(height: 16.h),
                  _buildAgeGroupCard(
                    title: 'U10 Boys Gold',
                    time: 'Friday | April 26',
                    coach: 'Brad',
                    topic: 'Passing Accuracy',
                    lastObserved:
                        '', // No last observed shown in design for this one
                    showNeedObservation: false,
                    isPlanned: true,
                    onActionTap: () {
                      // View Notes action
                    },
                    actionLabel: 'View Notes',
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomBackButton(
                onPressed: () => Get.back(),
                backgroundColor: const Color(0xFFE8F3FF),
                iconColor: const Color(0xFF00204A),
              ),
              Text(
                'Session Observations',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 24.w), // Balance for back button
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown() {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0x26000000),
            blurRadius: 6.w,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'U9-U10',
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: ' Age groups',
                  style: TextStyle(
                    color: const Color(0xB2012356), // slightly transparent
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: const Color(0xFF012356),
          ), // Placeholder icon
        ],
      ),
    );
  }

  Widget _buildNeedsObservationBanner() {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
        border: Border.all(
          color: const Color(0xFF0296F7),
          width: 1.w,
        ), // Added blue border matching screenshot hint
        boxShadow: [
          BoxShadow(
            color: const Color(0x26000000),
            blurRadius: 6.w,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: const Color(0xFFEBC351),
            size: 24.w,
          ),
          SizedBox(width: 8.w),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Needs Observation ',
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: '(2)',
                  style: TextStyle(
                    color: const Color(0x99012356),
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAgeGroupCard({
    required String title,
    required String time,
    required String coach,
    required String topic,
    String? lastObserved,
    required bool showNeedObservation,
    required VoidCallback onActionTap,
    required String actionLabel,
    bool isPlanned = false,
  }) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0x28000000),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24.w,
                    height: 24.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF012356), // Placeholder for person icon
                    ),
                    child: Icon(Icons.person, color: Colors.white, size: 16.w),
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: const Color(0xFF012356),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        time,
                        style: TextStyle(
                          color: const Color(0x99012356),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (showNeedObservation)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5EBD5),
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                  child: Text(
                    'Need Observation',
                    style: TextStyle(
                      color: const Color(0xFFCA8F0E),
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              else if (isPlanned)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9EBF3),
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                  child: Text(
                    'Planned',
                    style: TextStyle(
                      color: const Color(0xFF1E6B8E),
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 12.h),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Coach: ',
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: coach,
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            topic,
            style: TextStyle(
              color: const Color(0xCC012356),
              fontSize: 12.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          if (lastObserved != null && lastObserved.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Text(
                lastObserved,
                style: TextStyle(
                  color: const Color(0xCC012356),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F6),
                  borderRadius: BorderRadius.circular(4.w),
                ),
                child: Text(
                  'Passing', // Tag
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 12.sp,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onActionTap,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5EAF4),
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                  child: Row(
                    children: [
                      if (actionLabel == 'Add Note')
                        Icon(
                          Icons.add,
                          size: 16.w,
                          color: const Color(0xFF012356),
                        ),
                      SizedBox(width: 4.w),
                      Text(
                        actionLabel,
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
