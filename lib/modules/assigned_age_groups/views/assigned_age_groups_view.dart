import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/custom_back_button.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/assigned_age_groups_controller.dart';
import 'age_group_detail_view.dart';

class AssignedAgeGroupsView extends GetView<AssignedAgeGroupsController> {
  const AssignedAgeGroupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF5FF), // Light background
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 20.h),
            _buildSearchBar(),
            SizedBox(height: 16.h),
            _buildFilterChips(),
            SizedBox(height: 16.h),
            _buildCoachFilterChips(),
            SizedBox(height: 16.h),
            _buildTeamList(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
      bottomNavigationBar: () {
        if (Get.isRegistered<HomeController>()) {
          final homeController = Get.find<HomeController>();
          return Obx(
            () => CustomBottomNavBar(
              selectedIndex: homeController.selectedIndex.value,
              onItemTapped: homeController.changeTabIndex,
            ),
          );
        }
        return null;
      }(),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 60.h,
        left: 20.w,
        right: 20.w,
        bottom: 20.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF012355),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.w),
          bottomRight: Radius.circular(32.w),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1E000000),
            blurRadius: 10.h,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomBackButton(
                onPressed: () => Get.back(),
                backgroundColor: Colors.white,
                iconColor: const Color(0xFF00204A),
              ),
              const Spacer(),
              Text(
                'Age Group Oversight',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              SizedBox(width: 48.w), // Balance back button
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      width: 335.w,
      height: 48.h, // Approx 31px + padding -> 48 responsive
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0x28000000),
            blurRadius: 6.w,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: const Color(0xFF012356).withValues(alpha: 0.5),
            size: 20.w,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search teams',
                hintStyle: TextStyle(
                  color: const Color(0x99012356),
                  fontSize: 14.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          _buildChip('All (32)', isActive: true),
          SizedBox(width: 12.w),
          _buildChip('7v7 (8)'),
          SizedBox(width: 12.w),
          _buildChip('9v9 (12)'),
          SizedBox(width: 12.w),
          _buildChip('11v11 (12)'),
        ],
      ),
    );
  }

  Widget _buildCoachFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          _buildChip(
            'All Coaches',
            isWhite: true,
            textColor: const Color(0xFF012356),
            fontWeight: FontWeight.w500,
          ),
          SizedBox(width: 12.w),
          _buildChip('Jake', isWhite: true),
          SizedBox(width: 12.w),
          _buildChip('Antonio', isWhite: true),
        ],
      ),
    );
  }

  Widget _buildChip(
    String label, {
    bool isActive = false,
    bool isWhite = false,
    Color? textColor,
    FontWeight? fontWeight,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF012356) : Colors.white,
        borderRadius: BorderRadius.circular(4.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0x28000000),
            blurRadius: 6.w,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Text(
        label,
        style: TextStyle(
          color:
              textColor ?? (isActive ? Colors.white : const Color(0xCC012356)),
          fontSize: 14.sp,
          fontFamily: 'Inter',
          fontWeight: fontWeight ?? FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildTeamList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          _buildTeamCard(
            title: 'U9 Boys Premier',
            coach: 'Emily Warner',
            nextSession: '5:00 PM',
            tag: 'Ball control',
            statusText: 'No Concerns',
            statusColor: const Color(0xFF41A08D),
          ),
          SizedBox(height: 16.h),
          _buildTeamCard(
            title: 'U10 Boys Silver',
            coach: 'Jake',
            nextSession: '6:00 PM',
            tag: 'Passing',
            statusText: '2 Concerns',
            statusColor: const Color(0xFFD5594E),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamCard({
    required String title,
    required String coach,
    required String nextSession,
    required String tag,
    required String statusText,
    required Color statusColor,
  }) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const AgeGroupDetailView());
      },
      child: Container(
        width: 335.w,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.w),
          boxShadow: [
            BoxShadow(
              color: const Color(0x28000000),
              blurRadius: 6.w,
              offset: Offset(0, 3.h),
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
                      padding: EdgeInsets.all(
                        10.w,
                      ), // Placeholder padding for icon
                      decoration: const BoxDecoration(
                        color: Color(0xFFF8F9FB),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person,
                        color: const Color(0xFF012356),
                        size: 24.w,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Column(
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
                          coach,
                          style: TextStyle(
                            color: const Color(0xFF012356),
                            fontSize: 12.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.chevron_right,
                  color: const Color(0xFF012356).withValues(alpha: 0.5),
                  size: 24.w,
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              'Next Session | $nextSession',
              style: TextStyle(
                color: const Color(0x99012356),
                fontSize: 12.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE4E8F6),
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                  child: Text(
                    tag,
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 6.w,
                      height: 6.w,
                      decoration: BoxDecoration(
                        color: statusColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      statusText,
                      style: TextStyle(
                        color: statusColor,
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
      ),
    );
  }
}
