import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../global_widgets/custom_back_button.dart';

class ParentPlayerPortalView extends StatelessWidget {
  const ParentPlayerPortalView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      headerHeight: 124.h,
      headerContent: _buildHeaderContent(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              _buildBanner(),
              SizedBox(height: 32.h),
              _buildFeatureItem(
                title: 'Live Player Feedback',
                description:
                    'Player get instant coaching feedback & skill progression tracking',
                icon: Icons.reviews_outlined,
              ),
              SizedBox(height: 16.h),
              _buildFeatureItem(
                title: 'Personalized Development Plans',
                description:
                    'Individual growth plans that evolve with player performance',
                icon: Icons.manage_accounts_outlined,
              ),
              SizedBox(height: 32.h),
              _buildUpgradeButton(),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          CustomBackButton(
            onPressed: () => Get.back(),
            backgroundColor: Colors.white,
            iconColor: const Color(0xFF00204A),
          ),
          Center(
            child: Text(
              'Parent-Player Portal',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.04, -0.00),
          end: Alignment(1.15, 1.49),
          colors: [Color(0xFF162657), Color(0xFFCDD8FA)],
        ),
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
            'Parent-Player Portal',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Connect with parents & Empower Player',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Provide real-time feedback, progress insights and a structured support system for development',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem({
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Container(
      width: 335.w,
      height: 88.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
              child: SizedBox(
                width: 24.w,
                height: 24.w,
                child: Icon(icon, color: const Color(0xFF000000), size: 20.sp),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  description,
                  style: TextStyle(
                    color: const Color(0x99012356),
                    fontSize: 11.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpgradeButton() {
    return Center(
      child: SizedBox(
        width: 209.w,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3064AB),
            padding: EdgeInsets.symmetric(vertical: 10.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            'Upgrade Now',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
