import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../global_widgets/custom_back_button.dart';
import '../controllers/select_available_fields_controller.dart';

class SelectAvailableFieldsView
    extends GetView<SelectAvailableFieldsController> {
  const SelectAvailableFieldsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      headerContent: _buildHeader(),
      showBottomNav: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            children: [
              Obx(
                () => Column(
                  children: controller.availableFields
                      .map(
                        (field) => Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: _buildFieldOption(field),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(height: 32.h),
              _buildConfirmButton(),
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
              'Select Available Fields',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
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

  Widget _buildFieldOption(String title) {
    return Obx(() {
      final isSelected = controller.isFieldSelected(title);
      return GestureDetector(
        onTap: () => controller.toggleFieldSelection(title),
        child: Container(
          width: 335.w,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
              Text(
                title,
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF2F80ED)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(4.r),
                  border: isSelected
                      ? null
                      : Border.all(color: const Color(0xFF012355), width: 2),
                ),
                child: isSelected
                    ? Icon(Icons.check, size: 16.w, color: Colors.white)
                    : null,
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildConfirmButton() {
    return GestureDetector(
      onTap: controller.confirmSelection,
      child: Container(
        width: 335.w,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: const Color(0xFF3064AB),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            'Confirm Field',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
