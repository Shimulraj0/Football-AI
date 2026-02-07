import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../core/utils/size_utils.dart';
import 'add_new_tier_view.dart';

class TeamTiersView extends StatelessWidget {
  const TeamTiersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "Team Tiers",
      showBackButton: true,
      backgroundColor: const Color(0xFFEDF5FF),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              children: [
                _buildTierCard(
                  title: "Elite Academy",
                  subtitle: "Top 5% of players",
                  imagePath: "assets/images/profile_1.png", // Placeholder
                  onDelete: () {},
                ),
                SizedBox(height: 16.h),
                _buildTierCard(
                  title: "Competitive",
                  subtitle: "Top 5% of players",
                  imagePath: "assets/images/profile_2.png", // Placeholder
                  onDelete: () {},
                ),
                SizedBox(height: 16.h),
                _buildTierCard(
                  title: "Competitive",
                  subtitle: "Focus on local leagues",
                  imagePath: "assets/images/profile_1.png", // Placeholder
                  onDelete: () {},
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40.h,
            left: 0,
            right: 0,
            child: Center(child: _buildAddButton()),
          ),
        ],
      ),
    );
  }

  Widget _buildTierCard({
    required String title,
    required String subtitle,
    required String imagePath,
    required VoidCallback onDelete,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0x28000000),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                // Fallback to a color if image fails in dev
                onError: (e, s) {},
              ),
              color: Colors.grey.shade300,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
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
              ],
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.delete_outline,
              color: Color(0xFF909DAD), // Greyish color from screenshot usually
            ),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return Container(
      width: 189.w,
      height: 44.h,
      decoration: BoxDecoration(
        color: const Color(0xFF3064AB),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.to(() => const AddNewTierView());
          },
          borderRadius: BorderRadius.circular(8.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Colors.white, size: 24.w),
              SizedBox(width: 6.w),
              Text(
                'Add New Tier',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
