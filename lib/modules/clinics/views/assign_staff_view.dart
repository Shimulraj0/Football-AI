import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../../core/utils/size_utils.dart';
import '../controllers/clinics_controller.dart';

class AssignStaffView extends GetView<ClinicsController> {
  const AssignStaffView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      showBottomNav: true,
      title: "Assign Staff",
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 6.r,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Summer Soccer Skill Camp",
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                  ),
                  Icon(
                    Icons.edit_outlined,
                    color: const Color(0xFF012356),
                    size: 20.w,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              _buildSearchBar(),
              SizedBox(height: 24.h),
              Text(
                "Summer Soccer Skill Camp",
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                ),
              ),
              SizedBox(height: 12.h),
              _buildSectionHeader("Directors/DOCs"),
              _buildStaffCard(
                name: "Michael B.",
                role: "DOC",
                imageUrl: "assets/icons/Ellipse13.png",
                isSelected: false,
              ),
              _buildStaffCard(
                name: "Sara k.",
                role: "DOC",
                imageUrl: "assets/icons/Ellipse13.png",
                isSelected: true,
              ),
              SizedBox(height: 16.h),
              _buildSectionHeader("Coaches"),
              _buildStaffCard(
                name: "James R.",
                role: "Head Coach",
                imageUrl: "assets/icons/Ellipse13.png",
                isSelected: true,
              ),
              _buildStaffCard(
                name: "Emily Warner",
                role: "U12 Boys Premier",
                imageUrl: "assets/icons/Ellipse13.png",
                isSelected: true,
              ),
              _buildStaffCard(
                name: "Jason Myers",
                role: "Asst. Coach",
                imageUrl: "assets/icons/Ellipse13.png",
                isSelected: false,
              ),
              _buildStaffCard(
                name: "Ryan S.",
                role: "U12 Girls",
                imageUrl: "assets/icons/Ellipse13.png",
                isSelected: false,
              ),
              SizedBox(height: 24.h),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: Text(
                    "Assign Staff",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3064AB),
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 12.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search Coaches & DOCs",
          hintStyle: TextStyle(
            color: const Color(0x7F012356),
            fontSize: 14.sp,
            fontFamily: 'Inter',
          ),
          prefixIcon: Icon(
            Icons.search,
            color: const Color(0x7F012356),
            size: 20.w,
          ),
          suffixIcon: TextButton(
            onPressed: () {},
            child: Text(
              "Clear",
              style: TextStyle(
                color: const Color(0xFF0955C8),
                fontSize: 14.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xFFE2E9F4),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: const Color(0xFF012356),
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
        ),
      ),
    );
  }

  Widget _buildStaffCard({
    required String name,
    required String role,
    required String imageUrl,
    required bool isSelected,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 6.r,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 17.r, backgroundImage: AssetImage(imageUrl)),
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
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                    height: 1.1,
                  ),
                ),
                Text(
                  role,
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 24.w,
            height: 24.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? const Color(0xFF0955C8) : Colors.grey,
                width: 2.w,
              ),
              borderRadius: BorderRadius.circular(4.r),
              color: isSelected ? const Color(0xFF0955C8) : Colors.transparent,
            ),
            child: isSelected
                ? Icon(Icons.check, color: Colors.white, size: 16.w)
                : null,
          ),
        ],
      ),
    );
  }
}
