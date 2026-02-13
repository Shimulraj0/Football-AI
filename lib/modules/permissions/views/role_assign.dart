import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/custom_back_button.dart';

class RoleAssign extends StatefulWidget {
  const RoleAssign({super.key});

  @override
  State<RoleAssign> createState() => _RoleAssignState();
}

class _RoleAssignState extends State<RoleAssign> {
  // Simple state to track selection for demo purposes
  // In a real app, this would likely be managed by a controller
  final Set<String> _selectedRoles = {'DOC', 'Age Group Coordinator'};

  void _toggleRole(String role) {
    setState(() {
      if (_selectedRoles.contains(role)) {
        _selectedRoles.remove(role);
      } else {
        _selectedRoles.add(role);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      headerHeight: 90.h,
      headerContent: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomBackButton(
              onPressed: () => Get.back(),
              backgroundColor: const Color(0xFFE8F3FF),
              iconColor: const Color(0xFF012355),
            ),
            Expanded(
              child: Text(
                'Role Assignment',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(width: 44.w), // Balance back button
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF9F9F9),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              SizedBox(height: 24.h),
              Text(
                'Director Role',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16.h),
              _buildRoleItem("Technical Director"),
              SizedBox(height: 16.h),
              _buildRoleItem("DOC"),
              SizedBox(height: 16.h),
              _buildRoleItem("Age Group Coordinator"),
              SizedBox(height: 16.h),
              _buildRoleItem("Speciality Director"),
              SizedBox(height: 40.h),
              _buildSaveButton(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: ShapeDecoration(
        color: Colors.white,
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
        children: [
          Icon(
            Icons.search,
            color: const Color(0xFF9E9E9E),
            size: 24.w,
          ), // Assuming search icon
          SizedBox(width: 4.w),
          Expanded(
            child: Text(
              'Search staff or role',
              style: TextStyle(
                color: const Color(0x66012356),
                fontSize: 14.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 1.10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoleItem(String title) {
    final isSelected = _selectedRoles.contains(title);
    final backgroundColor = isSelected
        ? const Color(0xFF012356)
        : const Color(0xFFFEFEFE);
    final textColor = isSelected ? Colors.white : const Color(0xFF012356);

    return GestureDetector(
      onTap: () => _toggleRole(title),
      child: Container(
        width: double.infinity,
        height: 78.h,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ), // Added padding for content
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
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
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 48.w,
                    height: 48.w,
                    decoration: ShapeDecoration(
                      color: isSelected
                          ? const Color(0xFF012356)
                          : const Color(0xFFF9F9F9), // Background of icon box
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.person_outline,
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF012356),
                        size: 24.w,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Checkbox like indicator
            Container(
              width: 24.w,
              height: 24.w,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(
                  color: isSelected
                      ? Colors.transparent
                      : const Color(0xFFE0E0E0),
                  width: 1,
                ),
                color: isSelected
                    ? Colors.white
                    : Colors
                          .white, // In snippet, seems checkmark container is white on blue?
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: 16.w,
                      color: const Color(0xFF012356),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          // Handle save
          Get.back();
        },
        child: Container(
          width: 240.w,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Save & Assign',
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
