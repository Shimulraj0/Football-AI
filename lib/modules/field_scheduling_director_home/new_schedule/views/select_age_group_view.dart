import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../global_widgets/custom_back_button.dart';

class SelectAgeGroupView extends StatelessWidget {
  const SelectAgeGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      headerContent: _buildHeader(),
      showBottomNav: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildAgeGroupOption('U8-U10 boys Silver', isSelected: true),
              SizedBox(height: 16.h),
              _buildAgeGroupOption('U11-U13 boys gold'),
              SizedBox(height: 16.h),
              _buildAgeGroupOption('U14-U16 girls gold'),
              SizedBox(height: 16.h),
              _buildAgeGroupOption('U17+ boys gold'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: 375.w,
      height: 124.h,
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 13.h),
      alignment: Alignment.bottomCenter,
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
              'Select Age Group & Teams',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            width: 52.w,
          ), // Balance for CustomBackButton (44.w + 8.w padding)
        ],
      ),
    );
  }

  Widget _buildAgeGroupOption(String title, {bool isSelected = false}) {
    return Container(
      width: 172.w,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFCFE1FF) : Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0x19000000),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF012356),
            fontSize: 16.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
