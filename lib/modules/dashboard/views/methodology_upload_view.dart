import 'package:flutter/material.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../core/utils/size_utils.dart';

class MethodologyUploadView extends StatefulWidget {
  const MethodologyUploadView({super.key});

  @override
  State<MethodologyUploadView> createState() => _MethodologyUploadViewState();
}

class _MethodologyUploadViewState extends State<MethodologyUploadView> {
  bool _isPerTeamTier = true; // Toggle state

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "Methodology Upload",
      showBackButton: true,
      backgroundColor: const Color(0xFFEDF5FF),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            _buildTopControls(),
            SizedBox(height: 24.h),
            _buildTeamCardWithActions(title: "U10 Boys - Navy Team"),
            SizedBox(height: 16.h),
            _buildTeamCardEmpty(title: "U12 Girls - White Team"),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildTopControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Per Age Group Button
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.r),
            boxShadow: [
              BoxShadow(
                color: const Color(0x28000000),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                Icons.add,
                size: 16.w,
                color: const Color(0xFF012356),
              ), // Wait, design shows just text and dot? No, it has an icon in code snippet logic usually, but here request shows "Per Age Group" with icon.
              // Actually looking at request snippet:
              // It has a container with size 20,20 stack... looks like a plus icon placeholder.
              SizedBox(width: 4.w),
              Text(
                "Per Age Group",
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 14.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        // Per Team Tier Toggle
        Row(
          children: [
            Text(
              "Per Team Tier",
              style: TextStyle(
                color: const Color(0xFF012356),
                fontSize: 14.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 12.w),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isPerTeamTier = !_isPerTeamTier;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 40.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: _isPerTeamTier ? const Color(0xFF0260ED) : Colors.grey,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 200),
                      left: _isPerTeamTier ? 22.w : 2.w,
                      top: 2.h,
                      child: Container(
                        width: 16.w,
                        height: 16.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTeamCardWithActions({required String title}) {
    return Container(
      width: 335.w,
      height: 128.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment
            .spaceBetween, // Use spaceBetween to distribute vertical space
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
          SizedBox(
            height: 12.h,
          ), // Reduced fixed filler if needed, but spaceBetween handles it
          Row(
            children: [
              _buildActionButton(
                label: "Upload Document",
                backgroundColor: const Color(0xFF1C355E),
                textColor: Colors.white,
                onTap: () {},
              ),
              SizedBox(width: 12.w),
              _buildActionButton(
                label: "View Library",
                backgroundColor: const Color(0xFFF0F1F3),
                textColor: const Color(0xFF012356),
                borderColor: const Color(0x19012356),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTeamCardEmpty({required String title}) {
    return Container(
      width: 335.w,
      height: 128.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF0F2),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              "No files uploaded yet",
              style: TextStyle(
                color: const Color(0x66012356),
                fontSize: 14.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required Color backgroundColor,
    required Color textColor,
    Color? borderColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 8.h,
        ), // adjusted padding
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(6.r),
          border: borderColor != null ? Border.all(color: borderColor) : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 14.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
