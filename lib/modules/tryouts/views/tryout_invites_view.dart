import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';

class TryoutInvitesView extends GetView {
  const TryoutInvitesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Send New Invites',
      showBackButton: true,
      backgroundColor: const Color(0xFFF5F9FF),
      showBottomNav: true,
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
            SizedBox(height: 20.h),
            _buildPlayerCard(
              name: 'Andrew R.',
              team: 'U10 Boys Silver',
              imagePath: 'assets/images/andrew.png',
              isSelected: false,
              onTap: () {},
            ),
            SizedBox(height: 12.h),
            _buildPlayerCard(
              name: 'Lawrence',
              team: 'U10 Boys Gold',
              imagePath: 'assets/images/lawrence.png',
              isSelected: true,
              onTap: () {},
            ),
            SizedBox(height: 12.h),
            _buildPlayerCard(
              name: 'Sophinar',
              team: 'U10 Boys Silver',
              imagePath: 'assets/images/sophinar.png',
              isSelected: false,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerCard({
    required String name,
    required String team,
    required String imagePath,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
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
        child: Row(
          children: [
            Container(
              width: 34.w,
              height: 34.h,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
                shape: const OvalBorder(),
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
                  Text(
                    team,
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
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF007AFF)
                      : const Color(0xFF202020),
                  width: 2.w,
                ),
                color: isSelected
                    ? const Color(0xFF007AFF)
                    : Colors.transparent,
              ),
              child: isSelected
                  ? Icon(Icons.check, color: Colors.white, size: 16.w)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
