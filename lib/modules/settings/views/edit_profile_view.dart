import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../../../global_widgets/custom_back_button.dart';
import '../../home/controllers/home_controller.dart';
import '../../../../core/utils/size_utils.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300.h,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  _buildHeader(),
                  _buildCoverPhoto(),
                  _buildProfileAvatar(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  _buildTextField("Full name", "Sarah Martinez"),
                  SizedBox(height: 30.h),
                  _buildEditProfileButton(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: () {
        if (Get.isRegistered<HomeController>()) {
          final homeController = Get.find<HomeController>();
          return Obx(
            () => CustomBottomNavBar(
              selectedIndex: homeController.selectedIndex.value,
              onItemTapped: homeController.changeTabIndex,
            ),
          );
        } else {
          return null;
        }
      }(),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 110.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF012355),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.r),
          bottomRight: Radius.circular(32.r),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1E000000),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBackButton(
                onPressed: () => Get.back(),
                backgroundColor: Colors.white,
                iconColor: const Color(0xFF012355),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Text(
                    "Edit Profile",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
              SizedBox(width: 40.w), // Balance the back button
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCoverPhoto() {
    return Positioned(
      top: 75.h,
      left: 0,
      right: 0,
      child: Center(
        child: SizedBox(
          width: 335.w, // Match design width roughly
          height: 125.h,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Obx(
                    () => controller.coverImage.value != null
                        ? Image.file(
                            controller.coverImage.value!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          )
                        : Image.network(
                            "https://placehold.co/376x162", // Placeholder as requested, or replace with asset
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset(
                                  'assets/images/football_player_cover.png',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                          ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10.h,
                right: 10.w,
                child: GestureDetector(
                  onTap: () => controller.pickImage(isCover: true),
                  child: Container(
                    padding: EdgeInsets.all(6.w),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: const Color(0xFF012355),
                      size: 16.w,
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

  Widget _buildProfileAvatar() {
    return Positioned(
      top: 130.h, // Moved further down as requested
      left: 0,
      right: 0,
      child: Center(
        child: Stack(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: ShapeDecoration(
                shape: OvalBorder(
                  side: BorderSide(
                    width: 4,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: const Color(0xFF012355),
                  ),
                ),
                shadows: [
                  BoxShadow(
                    color: const Color(0x19000000),
                    blurRadius: 20,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Obx(
                () => ClipOval(
                  child: controller.profileImage.value != null
                      ? Image.file(
                          controller.profileImage.value!,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          "https://placehold.co/120x120",
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                                'assets/images/football_player_thumb.png',
                                fit: BoxFit.cover,
                              ),
                        ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () => controller.pickImage(isCover: false),
                child: Container(
                  width: 30.w,
                  height: 30.w,
                  padding: EdgeInsets.all(6.w),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFEFEFE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(120),
                    ),
                    shadows: [
                      BoxShadow(
                        color: const Color(0x14000000),
                        blurRadius: 6.50,
                        offset: const Offset(0, 4),
                      ),
                      BoxShadow(
                        color: const Color(0x3F000000),
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    color: const Color(0xFF012355),
                    size: 16.w,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String initialValue) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFEFEFE),
        border: Border.all(color: const Color(0xFF959595)),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextFormField(
        initialValue: initialValue,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 16.sp,
          fontFamily: 'Inter',
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: const Color(0xFF707070),
            fontSize: 14.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 8.h),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      ),
    );
  }

  Widget _buildEditProfileButton() {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF012355),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          elevation: 0,
        ),
        child: Text(
          "Edit profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
      ),
    );
  }
}
