import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/custom_back_button.dart';

class RoleAssignmentView extends StatefulWidget {
  const RoleAssignmentView({super.key});

  @override
  State<RoleAssignmentView> createState() => _RoleAssignmentViewState();
}

class _RoleAssignmentViewState extends State<RoleAssignmentView> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      headerHeight: 124.h,
      headerContent: _buildHeaderContent(),
      backgroundColor: const Color(0xFFF9F9F9),
      body: Column(
        children: [
          // Header moved to BaseScaffold
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchBar(),
                  SizedBox(height: 24.h),
                  _buildSectionTitle("Director Role"),
                  SizedBox(height: 16.h),
                  _buildRoleCard("Technical Director"),
                  SizedBox(height: 16.h),
                  _buildRoleCard("DOC"),
                  SizedBox(height: 16.h),
                  _buildRoleCard("Age Group Coordinator"),
                  SizedBox(height: 16.h),
                  _buildRoleCard("Speciality Director"),
                  SizedBox(height: 40.h),
                  _buildAssignRoleButton(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        children: [
          CustomBackButton(onPressed: () => Get.back()),
          Expanded(
            child: Text(
              "Role Assignment",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
            ),
          ),
          SizedBox(width: 44.w), // Balance back button
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 48.h,
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
          Icon(Icons.search, color: const Color(0xFF9E9E9E), size: 24.w),
          SizedBox(width: 8.w),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search staff or role",
                hintStyle: TextStyle(
                  color: const Color(0x66012356),
                  fontSize: 14.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: const Color(0xFF012356),
        fontSize: 16.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildRoleCard(String title) {
    return Container(
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9F9F9),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.person_outline, // Placeholder icon
                      color: const Color(0xFF012356),
                      size: 24.w,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: const Color(0xFFD8E0F0),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Row(
              children: [
                Icon(Icons.add, size: 16.w, color: const Color(0xFF012356)),
                SizedBox(width: 4.w),
                Text(
                  "Assign", // Typo fix: "Assaign" -> "Assign"
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
    );
  }

  Widget _buildAssignRoleButton() {
    return Center(
      child: Container(
        width: 240.w,
        height: 44.h,
        decoration: BoxDecoration(
          color: const Color(0xFF3064AB),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, color: Colors.white, size: 24.w),
            SizedBox(width: 8.w),
            Text(
              "Assign Role",
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
}
