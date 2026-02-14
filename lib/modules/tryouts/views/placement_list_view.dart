import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../home/controllers/home_controller.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../../../routes/app_routes.dart';

class PlacementListView extends GetView {
  const PlacementListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Placement',
      showBackButton: true,
      backgroundColor: const Color(0xFFF5F9FF),
      showBottomNav: true,
      bottomNavigationBar: () {
        if (Get.isRegistered<HomeController>()) {
          final homeController = Get.find<HomeController>();
          return Obx(
            () => CustomBottomNavBar(
              selectedIndex: homeController.selectedIndex.value,
              onItemTapped: homeController.changeTabIndex,
            ),
          );
        } else {
          return CustomBottomNavBar(
            selectedIndex: 0,
            onItemTapped: (index) {
              if (index == 0) Get.offAllNamed(AppRoutes.home);
            },
          );
        }
      }(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'U10 Boys Tryout',
              style: TextStyle(
                color: const Color(0xFF012356),
                fontSize: 16.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'Jan 20',
              style: TextStyle(
                color: const Color(0xFF012356).withValues(alpha: 0.5),
                fontSize: 14.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20.h),
            _buildPlayerCard(
              name: 'Andrew',
              status: 'Pending',
              statusColor: const Color(0xFFCB6E00),
              statusBgColor: const Color(0xFFF6E6D3),
              subtext: 'Ready for placements',
              showAssign: true,
              assignTo: 'B',
            ),
            SizedBox(height: 16.h),
            _buildPlayerCard(
              name: 'Aiden J.',
              status: 'Pending',
              statusColor: const Color(0xFFCB6E00),
              statusBgColor: const Color(0xFFF6E6D3),
              subtext: 'Ready for placements',
              showAssign: true,
              assignTo: 'A',
            ),
            SizedBox(height: 16.h),
            _buildPlayerCard(
              name: 'Lucas M.',
              status: 'In Review',
              statusColor: const Color(0xFF3A99FF),
              statusBgColor: const Color(0xFFE0EEFD),
              subtext: 'Under review',
              showAssign: false,
              assignTo: '',
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerCard({
    required String name,
    required String status,
    required Color statusColor,
    required Color statusBgColor,
    required String subtext,
    required bool showAssign,
    required String assignTo,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        shadows: [
          BoxShadow(
            color: const Color(0x28000000),
            blurRadius: 6.r,
            offset: Offset(0, 3.h),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      subtext,
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: ShapeDecoration(
                  color: statusBgColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          if (showAssign) ...[
            SizedBox(height: 12.h),
            const Divider(height: 1, color: Color(0xFFE0E0E0)),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Assign to',
                  style: TextStyle(
                    color: const Color(0xFF012356).withValues(alpha: 0.5),
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  width: 54.w,
                  height: 23.h,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF5F5F7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  child: Text(
                    assignTo,
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 14.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
