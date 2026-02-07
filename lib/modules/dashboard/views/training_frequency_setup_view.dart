import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../core/utils/size_utils.dart';
import 'add_age_group_view.dart';

class TrainingFrequencySetupView extends StatefulWidget {
  const TrainingFrequencySetupView({super.key});

  @override
  State<TrainingFrequencySetupView> createState() =>
      _TrainingFrequencySetupViewState();
}

class _TrainingFrequencySetupViewState
    extends State<TrainingFrequencySetupView> {
  bool _isPerTeamTier = true; // Toggle state

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "Training Frequency Setup",
      showBackButton: true,
      backgroundColor: const Color(0xFFEDF5FF),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            _buildTopControls(),
            SizedBox(height: 24.h),
            _buildTeamCard(
              title: "U10 Boys - Navy Team",
              subtitle: "Number of session / week",
              isExpanded: true,
            ),
            SizedBox(height: 16.h),
            _buildTeamCard(
              title: "U10 Boys - Blue Team",
              subtitle: "3 Sessions/Week",
              isExpanded: false,
            ),
            SizedBox(height: 16.h),
            _buildTeamCard(
              title: "U12 Girls - White Team",
              subtitle: "3 Sessions/Week",
              isExpanded: false,
            ),
            SizedBox(height: 40.h),
            _buildAddAgeGroupButton(),
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
        // per age group button (looks like a tab or button)
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
              Icon(Icons.add, size: 16.w, color: const Color(0xFF012356)),
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

  Widget _buildTeamCard({
    required String title,
    required String subtitle,
    required bool isExpanded,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
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
          if (isExpanded) ...[SizedBox(height: 16.h), _buildScheduleGrid()],
        ],
      ),
    );
  }

  Widget _buildScheduleGrid() {
    final days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    // Hardcoded schedule pattern for demo matching user design
    // 3 sessions: Mon(Evening), Wed(Evening), Thu(Evening), Fri(Evening), Sun(Evening) - waiting, let's look at the blocks.
    // User code creates blocks.
    // The user design shows a grid. Text "Mon" .. "Sun".
    // And colored blocks.

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0x33012356)),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Table(
        border: TableBorder(
          horizontalInside: BorderSide(
            color: const Color(0x33012356),
            width: 1,
          ),
          verticalInside: BorderSide(color: const Color(0x33012356), width: 1),
        ),
        children: [
          // Header Row
          TableRow(
            children: days
                .map(
                  (day) => Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Text(
                      day,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF012356),
                        fontSize: 12.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          // Grid Rows (Placeholder for time slots)
          // Row 1
          TableRow(
            children: List.generate(7, (index) {
              // Example pattern: Mon, Wed, Thu, Sat?
              // Using indices: 0(Mon), 2(Wed), 3(Thu), 6(Sun) based on user snippet roughly
              bool isSelected = [0].contains(index);
              return _buildGridCell(isSelected);
            }),
          ),
          // Row 2
          TableRow(
            children: List.generate(7, (index) {
              bool isSelected = [2, 4, 5].contains(index); // Wed, Fri, Sat
              return _buildGridCell(isSelected);
            }),
          ),
          // Row 3
          TableRow(
            children: List.generate(7, (index) {
              bool isSelected = [3, 6].contains(index); // Thu, Sun
              return _buildGridCell(isSelected);
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildGridCell(bool isSelected) {
    return Container(
      height: 30.h,
      color: isSelected ? const Color(0xFF012356) : Colors.transparent,
    );
  }

  Widget _buildAddAgeGroupButton() {
    return GestureDetector(
      onTap: () {
        Get.to(() => const AddAgeGroupView());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: const Color(0xFF046BDA),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, color: Colors.white, size: 20.w),
            SizedBox(width: 8.w),
            Text(
              "Add Age Group",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
