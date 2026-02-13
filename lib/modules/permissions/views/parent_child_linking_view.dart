import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/custom_back_button.dart';
import 'create_link_view.dart';

class ParentChildLinkingView extends StatelessWidget {
  const ParentChildLinkingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader:
          true, // We'll use BaseScaffold but emulate the snippet's look in headerContent
      headerHeight: 90.h,
      // The snippet has a specific rounded bottom blue header.
      // BaseScaffold might constrain us, but let's try to match the content styles at least.
      // If BaseScaffold enforces a different background, we might need to adjust.
      // Assuming BaseScaffold allows custom header content.
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
                'Parent-Child Linking',
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
              Row(
                children: [
                  _buildAddIconPlaceholder(),
                  SizedBox(width: 16.w),
                  _buildAddLinkButton(),
                ],
              ),
              SizedBox(height: 24.h),
              _buildLinkedItem(
                parentName: "Parent Smith",
                childName: "Bella",
                imageUrl: "assets/images/321.png",
              ),
              SizedBox(height: 16.h),
              _buildLinkedItem(
                parentName: "Shanti Smith",
                childName: "Alpha",
                // Placeholder color from snippet for avatar
                isPlaceholderAvatar: true,
              ),
              SizedBox(height: 16.h),
              _buildLinkedItem(
                parentName: "Jasenson",
                childName: "Bolla",
                isPlaceholderAvatar: true,
              ),
              SizedBox(height: 40.h),
              _buildCreateFirstLinkButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddIconPlaceholder() {
    return Container(
      width: 54.w,
      height: 54.w,
      padding: EdgeInsets.all(15.w),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withValues(alpha: 0.20),
          ),
          borderRadius: BorderRadius.circular(27.r),
        ),
      ),
      child: Center(
        child: Icon(
          Icons.people_outline,
          color: Colors.black,
          size: 24.w,
        ), // Placeholder icon
      ),
    );
  }

  Widget _buildAddLinkButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: ShapeDecoration(
        color: const Color(0xFF046BDA),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add, color: Colors.white, size: 24.w),
          SizedBox(width: 6.w),
          Text(
            'Add Link',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLinkedItem({
    required String parentName,
    required String childName,
    String? imageUrl,
    bool isPlaceholderAvatar = false,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withValues(alpha: 0.10),
          ),
          borderRadius: BorderRadius.circular(
            8.r,
          ), // Added radius for better look though snippet just says border
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
                          fit: BoxFit.cover,
                        )
                      : null,
                  shape: OvalBorder(),
                ),
              ),
              SizedBox(
                width: 12.w,
              ), // spacing 3 in snippet seems small, using 12 for consistency or stick to snippet? Snippet said spacing 3.
              // Snippet: Row spacing 3. 3 pixels? 3 logical pixels.
              // Standard design system usually uses increments of 4 or 8.
              // I will use 12 for better touch target separation as per previous views,
              // but if snippet is strict ... snippet code says `spacing: 3`.
              // 3 is very tight. let's check `3` in `Row`...
              // Wait, snippet uses `spacing: 3` which implies `Gap(3)` or `SizedBox(width: 3)`.
              // I'll stick to a slightly larger gap for safety unless user complains, or maybe 8.
              // Let's use 12 to match other list items I made.
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    parentName,
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Child: $childName',
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
          Container(
            padding: EdgeInsets.all(6.w),
            decoration: ShapeDecoration(
              color: const Color(0xFFFDECED),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
            child: Text(
              'Unlink',
              style: TextStyle(
                color: const Color(0xFFDD2E34),
                fontSize: 12.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateFirstLinkButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          Get.to(() => const CreateLinkView());
        },
        child: Container(
          width: 240
              .w, // Snippet says width 169? "Create First Link" container width 169.
          // Ill use snippet width of 169 if possible, or adequate padding.
          // Snippet: width: 169.
          // Previous buttons were 240.w. I'll use 240.w for consistency or 169?
          // Let's use 200.w or wrap content.
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
                'Create First Link',
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
