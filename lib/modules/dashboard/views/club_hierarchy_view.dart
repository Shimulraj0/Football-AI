import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global_widgets/base_scaffold.dart';
import '../../../../core/utils/size_utils.dart';
import 'add_new_role_view.dart';
import '../controllers/dashboard_controller.dart';

class ClubHierarchyView extends GetView<DashboardController> {
  const ClubHierarchyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Club Hirerachy',
      showBottomNav: true,
      backgroundColor: const Color(0xFFEEF5FF),
      body: Stack(
        children: [
          // Background Color/Gradient if needed, generally F8F9FE is fine
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    top: 24.h,
                    bottom: 100.h, // Space for bottom content if needed
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildSearchBar(),
                      // ... rest of body ...
                      SizedBox(height: 20.h),

                      _buildSectionCard(
                        title: 'Executive Board',
                        children: [
                          _buildMemberCard(
                            name: 'Billy Warner',
                            role: 'President',
                            imagePath: 'assets/images/profile_1.png',
                          ),
                          SizedBox(height: 12.h),
                          _buildMemberCard(
                            name: 'John Smith',
                            role: 'Vice-President',
                            imagePath: 'assets/images/profile_2.png',
                            showActions: true,
                          ),
                          SizedBox(height: 12.h),
                          _buildMemberCard(
                            name: 'Michael Brown',
                            role: 'Head Coaching',
                            imagePath: 'assets/images/profile_1.png',
                            showActions: true,
                          ),
                        ],
                      ),

                      SizedBox(height: 20.h),

                      _buildSectionCard(
                        title: 'Technical Director',
                        children: [
                          _buildMemberCard(
                            name: 'David Chen',
                            role: 'Head of Coching',
                            imagePath: 'assets/images/profile_2.png',
                            showActions: true,
                          ),
                          SizedBox(height: 12.h),
                          _buildMemberCard(
                            name: 'Miro White',
                            role: 'Age- Group cordinator',
                            imagePath: 'assets/images/profile_1.png',
                            showActions: true,
                          ),
                          SizedBox(height: 12.h),
                          _buildMemberCard(
                            name: 'Will Smith',
                            role: 'Operation Manager',
                            imagePath: 'assets/images/profile_2.png',
                            showActions: true,
                          ),
                        ],
                      ),

                      SizedBox(height: 30.h),
                      _buildAddNewRoleButton(),
                      SizedBox(height: 20.h), // Bottom padding
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

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        shadows: const [
          BoxShadow(
            color: Color(0x28000000),
            blurRadius: 6,
            offset: Offset(0, 3),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(4.w),
            child: Icon(
              Icons.search,
              size: 24.w,
              color: const Color(0xFF012356).withOpacity(0.4),
            ),
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: Text(
              'Search name',
              style: TextStyle(
                color: const Color(0x66012356),
                fontSize: 14.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddNewRoleButton() {
    return GestureDetector(
      onTap: () => Get.to(() => const AddNewRoleView()),
      child: Container(
        width: 189.w,
        padding: EdgeInsets.all(10.w),
        decoration: ShapeDecoration(
          color: const Color(0xFF3064AB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 24.w,
              height: 24.w,
              child: Icon(Icons.add, size: 24.w, color: Colors.white),
            ),
            SizedBox(width: 6.w),
            Text(
              'Add New Role',
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
    );
  }

  Widget _buildSectionCard({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
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
        SizedBox(height: 12.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: ShapeDecoration(
            color: const Color(0xFFFEFEFE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x28000000),
                blurRadius: 6,
                offset: Offset(0, 3),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildMemberCard({
    required String name,
    required String role,
    required String imagePath,
    bool showActions = false,
  }) {
    return Container(
      // Removed fixed width 335.w to allow it to fit in parent
      padding: EdgeInsets.all(8.w),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        shadows: const [
          BoxShadow(
            color: Color(0x28000000),
            blurRadius: 6,
            offset: Offset(0, 3),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 36.w,
                  height: 36.w,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                    shape: const OvalBorder(),
                  ),
                ),
                SizedBox(width: 8.w),
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
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        role,
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
              ],
            ),
          ),
          if (showActions)
            Row(
              children: [
                SizedBox(width: 8.w),
                Icon(
                  Icons.chat_bubble_outline,
                  size: 20.w,
                  color: const Color(0xFF575757),
                ),
                SizedBox(width: 16.w),
                Icon(
                  Icons.phone_outlined,
                  size: 20.w,
                  color: const Color(0xFF575757),
                ),
                SizedBox(width: 8.w),
              ],
            ),
        ],
      ),
    );
  }
}
