import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/custom_back_button.dart';

class CreateLinkView extends StatelessWidget {
  const CreateLinkView({super.key});

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
                'Create First Link',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(width: 44.w),
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
              _buildSectionHeader("Select Parent"),
              SizedBox(height: 16.h),
              _buildSearchBar(),
              SizedBox(height: 16.h),
              _buildParentItem(
                name: "Parent Smith",
                email: "email@example.com",
                imageUrl: "assets/images/321.png",
              ),
              SizedBox(height: 12.h),
              _buildParentItem(
                name: "Shanti Smith",
                email: "email@example2.com",
                isPlaceholderAvatar: true,
              ),
              SizedBox(height: 32.h),
              _buildSectionHeader(
                "Select Player",
              ), // Changed from "Select Parent" to avoid confusion, though snippet said "Select Parent"
              SizedBox(height: 16.h),
              _buildSearchBar(),
              SizedBox(height: 16.h),
              _buildPlayerItem(
                name: "Player Name",
                ageGroup: "U10",
                imageUrl: "assets/images/321.png",
              ),
              SizedBox(height: 12.h),
              _buildPlayerItem(
                name: "Player Name",
                ageGroup: "U11",
                isPlaceholderAvatar: true,
              ),
              SizedBox(height: 40.h),
              _buildConfirmButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
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
          Icon(Icons.search, color: Colors.grey, size: 24.w),
          SizedBox(width: 8.w),
          Text(
            'Search name, email, phone',
            style: TextStyle(
              color: const Color(0x66012356),
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParentItem({
    required String name,
    required String email,
    String? imageUrl,
    bool isPlaceholderAvatar = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withValues(alpha: 0.10),
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 36.w,
                height: 36.w,
                decoration: ShapeDecoration(
                  color: isPlaceholderAvatar ? const Color(0xFFD9D9D9) : null,
                  image: !isPlaceholderAvatar && imageUrl != null
                      ? DecorationImage(
                          image: AssetImage("assets/images/321.png"),
                          fit: BoxFit.fill,
                        )
                      : null,
                  shape: OvalBorder(),
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          _buildSelectButton(),
        ],
      ),
    );
  }

  Widget _buildPlayerItem({
    required String name,
    required String ageGroup,
    String? imageUrl,
    bool isPlaceholderAvatar = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withValues(alpha: 0.10),
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 36.w,
                height: 36.w,
                decoration: ShapeDecoration(
                  color: isPlaceholderAvatar ? const Color(0xFFD9D9D9) : null,
                  image: !isPlaceholderAvatar && imageUrl != null
                      ? DecorationImage(
                          image: AssetImage("assets/images/321.png"),
                          fit: BoxFit.fill,
                        )
                      : null,
                  shape: OvalBorder(),
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Age Group: $ageGroup',
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          _buildSelectButton(),
        ],
      ),
    );
  }

  Widget _buildSelectButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: ShapeDecoration(
        color: const Color(0xFF046BDA),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
      ),
      child: Text(
        'Select',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildConfirmButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          Get.back(); // Simulate success
        },
        child: Container(
          width: 240.w,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: ShapeDecoration(
            color: const Color(0xFF046BDA),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Confirm & Link',
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
