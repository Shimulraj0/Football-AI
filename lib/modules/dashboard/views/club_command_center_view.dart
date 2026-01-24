import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global_widgets/base_scaffold.dart';
import '../../../../global_widgets/custom_back_button.dart';

import '../../../../core/utils/size_utils.dart';

import '../controllers/dashboard_controller.dart';

class ClubCommandCenterView extends GetView<DashboardController> {
  const ClubCommandCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: false,
      backgroundColor: const Color(0xFFEDF5FF),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(
                    onPressed: () => Get.back(),
                    backgroundColor: Colors.white,
                    iconColor: const Color(0xFF012356),
                  ),
                  Text(
                    'Club Command Center',
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 18.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 40.w), // Balance back button
                ],
              ),
              SizedBox(height: 30.h),

              // Staff Row
              Row(
                children: [
                  // Technical Director
                  Expanded(
                    child: _buildRoleCard(
                      title: 'Technical Director (TD)',
                      roleId: 'Technical Director',
                      isActive:
                          false, // Removed default active state to rely on selection
                      onTap: () =>
                          controller.selectClubRole('Technical Director'),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  // Director of Coaching
                  Expanded(
                    child: _buildRoleCard(
                      title: 'Director of Coaching (DOC)',
                      roleId: 'Director of Coaching',
                      isActive: false,
                      onTap: () =>
                          controller.selectClubRole('Director of Coaching'),
                      textColor: const Color(0xFF012356),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // Permissions & Setup Row
              Row(
                children: [
                  // Club Setup & Governance
                  Expanded(
                    child: _buildRoleCard(
                      title: 'CLUB SETUP & GOVERNANCE',
                      roleId: 'Club Setup',
                      isActive: false,
                      onTap: () => controller.selectClubRole('Club Setup'),
                      textColor: const Color(0xFF012356),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  // Permissions & Role assessment
                  Expanded(
                    child: _buildRoleCard(
                      title: 'PERMISSION & ROLE ASSESMENT',
                      roleId: 'Permissions',
                      isActive: false,
                      onTap: () => controller.selectClubRole('Permissions'),
                      textColor: const Color(0xFF012356),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard({
    required String title,
    bool isActive = false, // Kept for backward compatibility or default styling
    Color? textColor,
    VoidCallback? onTap,
    String? roleId, // Added roleId to identify selection
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Builder(
        builder: (context) {
          // Find the role model to get the asset
          final roleModel = roleId != null
              ? controller.roles.firstWhereOrNull((r) => r.id == roleId)
              : null;
          final assetPath =
              roleModel?.assetPath ?? 'assets/icons/ic_single_role.png';

          return Container(
            height: 120.h,
            padding: EdgeInsets.all(10.w),
            decoration: ShapeDecoration(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFF031945)),
                borderRadius: BorderRadius.circular(10.w),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: const BoxDecoration(color: Colors.transparent),
                  padding: EdgeInsets.all(8.w),
                  child: Image.asset(
                    assetPath,
                    color: textColor ?? const Color(0xFF012356),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor ?? Colors.black,
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
