import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../global_widgets/base_scaffold.dart';
import '../../../../global_widgets/custom_back_button.dart';

import '../../../../core/utils/size_utils.dart';

import '../controllers/dashboard_controller.dart';

class ClubCommandCenterView extends GetView<DashboardController> {
  const ClubCommandCenterView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: false,
      showBottomNav: false,
      backgroundColor: const Color(0xFFEDF5FF),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                child: Obx(
                  () => Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _buildPersonaCard(
                              title: "Technical\nDirector (TD)",
                              icon: "assets/icons/ic_single_role.png",
                              isFilled:
                                  controller.selectedRole.value ==
                                  'Technical Director',
                              onTap: () => controller.selectClubRole(
                                'Technical Director',
                              ),
                            ),
                          ),
                          SizedBox(width: 15.w),
                          Expanded(
                            child: _buildPersonaCard(
                              title: "Director of\nCoaching (DOC)",
                              icon: "assets/icons/ic_single_role.png",
                              isFilled:
                                  controller.selectedRole.value ==
                                  'Director of Coaching',
                              onTap: () => controller.selectClubRole(
                                'Director of Coaching',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          Expanded(
                            child: _buildPersonaCard(
                              title: "CLUB SETUP &\nGOVERNANCE",
                              icon: "assets/icons/Settings.svg",
                              isFilled:
                                  controller.selectedRole.value == 'Club Setup',
                              useSvg: true,
                              onTap: () =>
                                  controller.selectClubRole('Club Setup'),
                            ),
                          ),
                          SizedBox(width: 15.w),
                          Expanded(
                            child: _buildPersonaCard(
                              title: "PERMISSION &\nROLE ASSESMENT",
                              icon: "assets/icons/Grouping.svg",
                              isFilled:
                                  controller.selectedRole.value ==
                                  'Permissions',
                              useSvg: true,
                              onTap: () =>
                                  controller.selectClubRole('Permissions'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        children: [
          CustomBackButton(onPressed: () => Get.back()),
          Expanded(
            child: Text(
              "Club Command Center",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF012356),
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
              ),
            ),
          ),
          SizedBox(width: 40.w), // Balance the back button space
        ],
      ),
    );
  }

  Widget _buildPersonaCard({
    required String title,
    required String icon,
    required VoidCallback onTap,
    bool isFilled = false,
    bool useSvg = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.w),
      child: Container(
        height: 120.h,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: isFilled ? const Color(0xFF012355) : Colors.white,
          borderRadius: BorderRadius.circular(10.w),
          border: isFilled
              ? null
              : Border.all(color: const Color(0xFF012355), width: 1.w),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon placeholder - using SVG or generic Icon
            if (useSvg)
              SvgPicture.asset(
                icon,
                width: 24.w,
                height: 24.w,
                colorFilter: ColorFilter.mode(
                  isFilled ? Colors.white : const Color(0xFF012356),
                  BlendMode.srcIn,
                ),
              )
            else
              Icon(
                Icons.person_outline, // Fallback/Placeholder
                size: 24.w,
                color: isFilled ? Colors.white : const Color(0xFF012356),
              ),
            SizedBox(height: 8.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isFilled ? Colors.white : const Color(0xFF012356),
                fontSize: 14.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
