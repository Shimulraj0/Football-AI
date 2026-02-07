import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../controllers/module_settings_controller.dart';

class ModuleSettingsView extends GetView<ModuleSettingsController> {
  const ModuleSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      title:
          'Module Setting', // Kept as requested in screenshot title, though likely "Settings"
      showBackButton: true,
      headerHeight: 124.h,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('General Setting'),
              SizedBox(height: 16.h),
              _buildToggleCard(
                title: 'U12 Scanning Checklist',
                subtitle: 'Make module public or private',
                valueRx: controller.u12ScanningChecklist,
                onChanged: controller.toggleU12ScanningChecklist,
              ),
              SizedBox(height: 16.h),
              _buildToggleCard(
                title: 'Allow Downloads',
                subtitle: 'Enable PDF & file downloads',
                valueRx: controller.allowDownloads,
                onChanged: controller.toggleAllowDownloads,
              ),
              SizedBox(height: 32.h),
              _buildSectionTitle('Access & Permissions'),
              SizedBox(height: 16.h),
              _buildToggleCard(
                title: 'Share With Role Access',
                subtitle: 'U12 Premier players, Coaches',
                valueRx: controller.shareRoleAccess,
                onChanged: controller.toggleShareRoleAccess,
              ),
              SizedBox(height: 32.h),
              _buildSectionTitle(
                'Access & Permissions',
              ), // Duplicate header as per design
              SizedBox(height: 16.h),
              _buildPurchaseCard(),
              SizedBox(height: 16.h),
              _buildPriceInput(),
              SizedBox(height: 40.h),
              Row(
                children: [
                  Expanded(child: _buildDeleteButton()),
                  SizedBox(width: 16.w),
                  Expanded(child: _buildSaveButton()),
                ],
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
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

  Widget _buildToggleCard({
    required String title,
    required String subtitle,
    required RxBool valueRx,
    required Function(bool) onChanged,
  }) {
    return Container(
      width: 335.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
                SizedBox(height: 8.h),
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
          Obx(
            () => Switch(
              value: valueRx.value,
              onChanged: onChanged,
              activeThumbColor: const Color(0xFF30C360),
              activeTrackColor: const Color(
                0xFF30C360,
              ).withValues(alpha: 0.2), // Optional styling
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPurchaseCard() {
    return Container(
      width: 335.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enable Purchase',
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Set price for this module',
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
          Obx(
            () => Switch(
              value: controller.enablePurchase.value,
              onChanged: controller.toggleEnablePurchase,
              activeThumbColor: const Color(0xFF30C360),
              // Default inactive color usually works, design shows grey toggles when off
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceInput() {
    return Row(
      children: [
        Text(
          'Price',
          style: TextStyle(
            color: const Color(0xFF012356),
            fontSize: 16.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Container(
            height: 34.h,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: const Color(0x19012356)),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: TextField(
              controller: controller.priceController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(bottom: 12), // Adjust alignment
              ),
              style: TextStyle(fontSize: 14.sp),
              keyboardType: TextInputType.number,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDeleteButton() {
    return GestureDetector(
      onTap: controller.deleteModule,
      child: Container(
        height: 48.h,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFDD2E34)),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(
          'Delete Module', // Fixed typo "Delet"
          style: TextStyle(
            color: const Color(0xFFDD2E34),
            fontSize: 16.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return GestureDetector(
      onTap: controller.saveChanges,
      child: Container(
        height: 48.h,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: const Color(0xFF0581EF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(
          'Save Changes',
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
