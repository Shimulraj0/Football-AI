import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../../core/utils/size_utils.dart';
import '../controllers/periodization_integration_controller.dart';

class PeriodizationIntegrationView
    extends GetView<PeriodizationIntegrationController> {
  const PeriodizationIntegrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      headerContent: _buildHeader(),
      showBottomNav: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            _buildCalendarCard(),
            SizedBox(height: 24.h),
            _buildScheduleCard(),
          ],
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
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Periodzation Integration",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 44.w,
              height: 44.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/Back.svg',
                  width: 24.w,
                  height: 24.w,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF00204A),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            // Swiped right -> Previous month
            controller.previousMonth();
          } else if (details.primaryVelocity! < 0) {
            // Swiped left -> Next month
            controller.nextMonth();
          }
        },
        child: Column(
          children: [
            // Header placeholder (Month Year)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: controller.previousMonth,
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 24.w,
                    ),
                  ),
                ),
                Obx(
                  () => Text(
                    controller.formattedMonthYear,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: controller.nextMonth,
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 24.w,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),

            // Days of week header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                'Sun',
                'Mon',
                'Tue',
                'Wed',
                'Thu',
                'Fri',
                'Sat',
              ].map((day) => _buildDayHeader(day)).toList(),
            ),
            SizedBox(height: 12.h),

            Obx(() {
              final days = controller.calendarDays;
              final selectedDate = controller
                  .selectedDate
                  .value; // Explicitly track selection changes
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 4,
                ),
                itemCount: days.length,
                itemBuilder: (context, index) {
                  final date = days[index];
                  if (date == null) {
                    return const SizedBox();
                  }

                  final isSelected =
                      date.year == selectedDate.year &&
                      date.month == selectedDate.month &&
                      date.day == selectedDate.day;

                  return GestureDetector(
                    onTap: () => controller.selectDate(date),
                    child: _buildDateCell(date.day.toString(), isSelected),
                  );
                },
              );
            }),

            SizedBox(height: 16.h),

            // Footer Buttons
            Row(
              children: [
                Expanded(
                  child: _buildActionButton(
                    'Today',
                    true,
                    controller.goToToday,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildActionButton(
                    'Clear',
                    false,
                    controller.clearSelection,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayHeader(String day) {
    return Expanded(
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'Inter',
          ),
        ),
      ),
    );
  }

  Widget _buildDateCell(String day, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF012356) : Colors.transparent,
        borderRadius: BorderRadius.circular(8.r),
      ),
      alignment: Alignment.center,
      child: Text(
        day,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 14.sp,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          fontFamily: 'Inter',
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, bool isPrimary, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isPrimary ? const Color(0xFF012356) : Colors.white,
          border: isPrimary ? null : Border.all(color: const Color(0xFFE5E5E5)),
          borderRadius: BorderRadius.circular(8.r),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: isPrimary ? Colors.white : Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
          ),
        ),
      ),
    );
  }

  Widget _buildScheduleCard() {
    return Obx(() {
      final isAdding = controller.isAddingTask.value;
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: isAdding ? const Color(0xFF32CFA7) : const Color(0xFF012356),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Header Row with Date and Plus Button
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF012356), // Always dark blue header
                borderRadius: isAdding
                    ? BorderRadius.only(
                        topLeft: Radius.circular(8.r),
                        topRight: Radius.circular(8.r),
                      )
                    : BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.only(
                left: 16.w,
                top: 16.h,
                right: 16.w,
                bottom: 8.h,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.formattedSelectedDateLabel,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: Container(
                      width: 6.w,
                      height: 6.w,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF3B30),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: controller.toggleAddTask,
                    child: Container(
                      width: 24.w,
                      height: 24.w,
                      decoration: const BoxDecoration(
                        color: Color(0xFF32CFA7),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isAdding ? Icons.close : Icons.add,
                        color: const Color(0xFF00204A),
                        size: 16.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Conditional Bottom Content
            if (isAdding) _buildAddTaskForm() else _buildDailyScheduleContent(),
          ],
        ),
      );
    });
  }

  Widget _buildDailyScheduleContent() {
    return Column(
      children: [
        _buildScheduleRow('Daily Schedule', controller.currentDailySchedule),
        _buildScheduleRow('Team Function', controller.currentTeamFunction),
        _buildScheduleRow('Physical Focus', controller.currentPhysicalFocus),

        // Last row without bottom border
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Physical Demand',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                ),
              ),
              Text(
                controller.currentPhysicalDemand,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAddTaskForm() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Title',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            height: 44.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Give a task title',
                hintStyle: TextStyle(
                  color: const Color(0xFF8E8E8E),
                  fontSize: 14.sp,
                  fontFamily: 'Inter',
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12.h,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Description',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            height: 100.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: TextField(
              maxLines: null,
              expands: true,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                hintText: 'Give a description of the project',
                hintStyle: TextStyle(
                  color: const Color(0xFF8E8E8E),
                  fontSize: 14.sp,
                  fontFamily: 'Inter',
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          GestureDetector(
            onTap: () {
              // Add task logic here
              controller.toggleAddTask();
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              decoration: BoxDecoration(
                color: const Color(
                  0xFF012356,
                ), // Use Dark Blue for the button for contrast
                borderRadius: BorderRadius.circular(8.r),
              ),
              alignment: Alignment.center,
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleRow(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.2), // Light separator line
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }
}
