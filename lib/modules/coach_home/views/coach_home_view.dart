import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../../core/utils/size_utils.dart';
import '../../home/controllers/home_controller.dart';
import '../../../routes/app_routes.dart';
import '../controllers/coach_home_controller.dart';

class CoachHomeView extends GetView<CoachHomeController> {
  const CoachHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<HomeController>()) {
      Get.find<HomeController>().currentHomeRoute.value = AppRoutes.coachHome;
    }

    return BaseScaffold(
      headerContent: _buildHeader(),
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
              _buildStatusCard(
                title: 'Players evaluated',
                icon: Icons.check, // Using icon mostly matching "tick"
                onTap: () {},
              ),
              SizedBox(height: 16.h),
              _buildStatusCard(
                title: 'Pending evaluations',
                icon: Icons.edit_document, // Using document icon
                onTap: () {},
              ),
              SizedBox(height: 16.h),
              _buildStatusCard(
                title: 'Completed this week',
                icon: Icons.assignment_turned_in, // Clipboard icon
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: 375.w,
      height: 124.h, // Fixed height validation
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 13.h),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
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
              SizedBox(width: 12.w),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: const Color(0xFFFEFEFE), // From snippet
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: 6.h), // Spacing 6 from snippet
                  Text(
                    "EVALUATION SYSTEM", // Caps from snippet
                    style: TextStyle(
                      color: const Color(0xFFFEFEFE),
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
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

  Widget _buildStatusCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 78.h, // Fixed height from snippet
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ), // Vertical alignment via Center
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r), // Radius 8 from snippet
          ),
          shadows: [
            BoxShadow(
              color: const Color(0x28000000), // Shadow from snippet
              blurRadius: 6,
              offset: const Offset(0, 3),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: ShapeDecoration(
                color: const Color(0xFFF9F9F9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Center(
                child: Icon(
                  // Using Icon but could be image if needed, keeping generic for now
                  icon,
                  color: const Color(
                    0xFF000000,
                  ), // Black icons in snippet (or close to it)
                  size: 24.w,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: const Color(0xFF012356), // Color from snippet
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: const Color(0xFF012356), // Matching title color
              size: 24.w,
            ),
          ],
        ),
      ),
    );
  }
}
