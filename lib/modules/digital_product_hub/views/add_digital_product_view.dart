import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/add_digital_product_controller.dart';

class AddDigitalProductView extends GetView<AddDigitalProductController> {
  const AddDigitalProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      title: 'Add Digital Product',
      showBackButton: true,
      headerHeight: 120
          .h, // Adjusted to match the curved look if BaseScaffold supports it, otherwise it uses default
      // If BaseScaffold doesn't support the specific curved bottom decoration on the header,
      // we might need to rely on its default implementation.
      // However, checking BaseScaffold, it uses PersistentHeader which might be customizable.
      // For now, we use the default BaseScaffold header which provides the title and back button consistently.
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Module Foundations',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16.h),
              _buildFoundationsCard(),
              SizedBox(height: 24.h),

              Text(
                'Coach',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              _buildCoachDropdown(),
              SizedBox(height: 24.h),

              Text(
                'Short Description',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              _buildDescriptionField(),
              SizedBox(height: 24.h),

              _buildManualBuilderCard(),
              SizedBox(height: 40.h),

              Center(child: _buildContinueButton()),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFoundationsCard() {
    return Container(
      width: double.infinity,
      height: 88.h,
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
        children: [
          Container(
            width: 82.w,
            height: 88.h,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFF0260ED)),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r),
                ),
              ),
            ),
            child: Center(
              // Placeholder icon as in snippet it shows existing Module Foundation like a photo
              child: Icon(
                Icons.add_a_photo_outlined,
                color: const Color(0xFF012356),
                size: 24.sp,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Text(
            'U12 Elite Ball Mastery',
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoachDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
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
      child: DropdownButtonHideUnderline(
        child: Obx(
          () => DropdownButton<String>(
            isExpanded: true,
            value: controller.selectedCoach.value.isEmpty
                ? null
                : controller.selectedCoach.value,
            hint: Text(
              'Select Coach',
              style: TextStyle(
                color: const Color(0x66012356),
                fontSize: 16.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: const Color(0xFF012356),
              size: 24.sp,
            ),
            items: controller.coaches.map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
            onChanged: controller.onCoachSelected,
          ),
        ),
      ),
    );
  }

  Widget _buildDescriptionField() {
    return Container(
      height: 70.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
      child: TextField(
        controller: controller.descriptionController,
        maxLines: 3,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Write short description',
          hintStyle: TextStyle(
            color: const Color(0x66012356),
            fontSize: 12.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildManualBuilderCard() {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.manualBuilder),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: ShapeDecoration(
          color: const Color(0xFFFEFEFE),
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
              child: Icon(
                Icons.directions_run,
                color: const Color(0xFF012356),
                size: 24.sp,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Manual Builder',
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Add your own drills, videos & text structure',
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
            Icon(Icons.chevron_right, color: const Color(0xFF012356)),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return GestureDetector(
      onTap: controller.onContinue,
      child: Container(
        width: 249.w,
        height: 44.h,
        decoration: ShapeDecoration(
          color: const Color(0xFF3064AB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          'Continue for Content',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
