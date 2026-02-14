import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../../core/utils/size_utils.dart';
import '../controllers/clinics_controller.dart';

class CreateClinicView extends GetView<ClinicsController> {
  const CreateClinicView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      showBottomNav: true,
      title: "Create New Clinic",
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel("Clinic Name"),
              SizedBox(height: 8.h),
              _buildTextField(hintText: ""),
              SizedBox(height: 16.h),
              _buildLabel("Description"),
              SizedBox(height: 8.h),
              _buildTextField(hintText: "", maxLines: 5),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel("Start Date"),
                        SizedBox(height: 8.h),
                        _buildTextField(
                          hintText: "Select Date",
                          suffixIcon: Icons.calendar_month_outlined,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel("End Date"),
                        SizedBox(height: 8.h),
                        _buildTextField(
                          hintText: "Select Date",
                          suffixIcon: Icons.calendar_month_outlined,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              _buildLabel("Time"),
              SizedBox(height: 8.h),
              _buildTextField(
                hintText: "Select time",
                suffixIcon: Icons.access_time,
              ),
              SizedBox(height: 16.h),
              _buildLabel("Location"),
              SizedBox(height: 8.h),
              _buildTextField(hintText: "write location"),
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0x33012356)),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select Age Group",
                      style: TextStyle(
                        color: const Color(0xFF012356),
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: const Color(0xFF012356),
                      size: 20.w,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0x33012356)),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Max Participants",
                      style: TextStyle(
                        color: const Color(0xFF012356),
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                      ),
                    ),
                    Text(
                      "30",
                      style: TextStyle(
                        color: const Color(0xFF012356),
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: Text(
                    "Create Clinic",
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

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        color: const Color(0xFF012356),
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        fontFamily: 'Inter',
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    IconData? suffixIcon,
    int maxLines = 1,
  }) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: const Color(0x7F012356),
          fontSize: 14.sp,
          fontFamily: 'Inter',
        ),
        suffixIcon: suffixIcon != null
            ? Icon(suffixIcon, color: const Color(0x7F012356), size: 18.w)
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Color(0x33012356)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Color(0x33012356)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      ),
    );
  }
}
