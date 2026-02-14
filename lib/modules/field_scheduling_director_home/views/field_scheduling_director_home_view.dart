import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../../core/utils/size_utils.dart';
import '../../home/controllers/home_controller.dart';
import '../../../routes/app_routes.dart';
import '../controllers/field_scheduling_director_home_controller.dart';

class FieldSchedulingDirectorHomeView
    extends GetView<FieldSchedulingDirectorHomeController> {
  const FieldSchedulingDirectorHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<HomeController>()) {
      Get.find<HomeController>().currentHomeRoute.value =
          AppRoutes.fieldSchedulingDirector;
    }

    return BaseScaffold(
      headerContent: _buildHeader(),
      showBottomNav: true,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        children: [
          _buildTodaysScheduleCard(),
          SizedBox(height: 24.h),
          Text(
            'Quick Actions',
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),
          _buildQuickActionCard(
            title: "New Schedule",
            icon: Icons.add,
            onTap: () => Get.toNamed(AppRoutes.newSchedule),
          ),
          SizedBox(height: 12.h),
          _buildQuickActionCard(
            title: "AI Scheduler",
            icon: Icons.smart_toy_outlined, // Using a relevant icon
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 13.h),
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Container(
            width: 51.w,
            height: 51.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.w),
              image: const DecorationImage(
                image: AssetImage('assets/icons/Ellipse13.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "Field Scheduling Director",
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications_outlined,
              color: const Color(0xFF00204A),
              size: 24.w,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodaysScheduleCard() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFFE5EFFC),
        borderRadius: BorderRadius.circular(16.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today’s Schedule', // Fixed typo from 'Scheduel'
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),
          _buildScheduleRow(
            icon: Icons.calendar_today,
            label: 'Total session today',
            value: '9',
          ),
          const Divider(height: 24, thickness: 1, color: Color(0x33012356)),
          _buildScheduleRow(
            icon: Icons.event_seat, // Placeholder icon for empty slots
            label: 'Empty slots',
            value: '4',
          ),
          const Divider(height: 24, thickness: 1, color: Color(0x33012356)),
          _buildScheduleRow(
            icon: Icons.warning_amber_rounded,
            label: 'Conflicts detected',
            value: '2',
            isWarning: true,
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleRow({
    required IconData icon,
    required String label,
    required String value,
    bool isWarning = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, size: 20.w, color: const Color(0xFF012355)),
            SizedBox(width: 8.w),
            Text(
              label,
              style: TextStyle(
                color: const Color(0xFF012355),
                fontSize: 14.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Text(
          value,
          style: TextStyle(
            color: const Color(0xFF012356),
            fontSize: 16.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFF012356), size: 24.w),
                SizedBox(width: 12.w),
                Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
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
}
