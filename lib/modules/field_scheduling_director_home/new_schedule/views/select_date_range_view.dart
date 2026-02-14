import 'package:flutter/material.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../core/utils/size_utils.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../global_widgets/custom_back_button.dart';

class SelectDateRangeView extends StatefulWidget {
  const SelectDateRangeView({super.key});

  @override
  State<SelectDateRangeView> createState() => _SelectDateRangeViewState();
}

class _SelectDateRangeViewState extends State<SelectDateRangeView> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      headerContent: _buildHeader(),
      showBottomNav: true,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  _buildCalendarCard(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: 375.w,
      height: 124.h,
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 13.h),
      alignment: Alignment.bottomCenter,
      decoration: ShapeDecoration(
        color: const Color(0xFF012355),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32.r),
            bottomRight: Radius.circular(32.r),
          ),
        ),
        shadows: [
          BoxShadow(
            color: const Color(0x1E000000),
            blurRadius: 10.10.r,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
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
              'Select Date Range',
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

  Widget _buildCalendarCard() {
    return Container(
      width: 335.w,
      padding: EdgeInsets.all(20.w),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        shadows: [
          BoxShadow(
            color: const Color(0x0C000000),
            blurRadius: 6.r,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: const Color(0x19000000),
            blurRadius: 15.r,
            offset: const Offset(0, 10),
            spreadRadius: -3,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 16.h),
            decoration: const ShapeDecoration(
              shape: Border(
                bottom: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Appoint schedule',
                        style: TextStyle(
                          color: const Color(0xFF111928),
                          fontSize: 18.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 1.50,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.close, size: 20.w, color: Colors.grey),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          _buildTableCalendar(),
          SizedBox(height: 20.h),
          Text(
            'Pick your time',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF111928),
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 1.50,
            ),
          ),
          SizedBox(height: 8.h),
          _buildTimeSlots(),
          SizedBox(height: 20.h),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildTableCalendar() {
    return Focus(
      descendantsAreFocusable: false,
      child: TableCalendar(
        firstDay: DateTime.utc(2020, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        calendarFormat: CalendarFormat.month,
        headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: TextStyle(
            color: const Color(0xFF111928),
            fontSize: 16.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
          leftChevronIcon: Icon(Icons.arrow_back, size: 20.w),
          rightChevronIcon: Icon(Icons.arrow_forward, size: 20.w),
        ),
        calendarStyle: CalendarStyle(
          selectedDecoration: BoxDecoration(
            color: const Color(0xFF3064AB),
            borderRadius: BorderRadius.circular(8.r),
          ),
          todayDecoration: BoxDecoration(
            color: const Color(0xFF3064AB).withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(8.r),
          ),
          defaultTextStyle: TextStyle(
            color: const Color(0xFF111928),
            fontSize: 14.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
          weekendTextStyle: TextStyle(
            color: const Color(0xFF6B7280),
            fontSize: 14.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
          outsideTextStyle: TextStyle(
            color: const Color(0xFF9CA3AF),
            fontSize: 14.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
          selectedTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
          todayTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
        ),
        daysOfWeekHeight: 40.h,
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            color: const Color(0xFF111928),
            fontSize: 13.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
          weekendStyle: TextStyle(
            color: const Color(0xFF111928),
            fontSize: 13.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildTimeSlots() {
    // 4 columns grid
    final times = [
      '9:00AM',
      '9:30AM',
      '10:00AM',
      '10:30AM',
      '11:00AM',
      '11:30AM',
      '12:00PM',
      '12:30PM',
      '13:00PM',
      '13:30PM',
      '14:00PM',
      '14:30PM',
      '15:00PM',
      '15:30PM',
      '16:00PM',
      '16:30PM',
      '17:00PM',
      '17:30PM',
      '18:00PM',
      '18:30PM',
    ];

    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: times.map((time) {
        bool isSelected = time == '14:00PM'; // From image
        return Container(
          width: 70.w,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: ShapeDecoration(
            color: isSelected ? const Color(0xFFEBF5FF) : Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: isSelected
                    ? const Color(0xFF1A56DB)
                    : const Color(0xFFE5E7EB),
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Center(
            child: Text(
              time,
              style: TextStyle(
                color: isSelected
                    ? const Color(0xFF1A56DB)
                    : const Color(0xFF6B7280),
                fontSize: 12.sp, // Reduced font size to fit
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 44.h,
            decoration: ShapeDecoration(
              color: const Color(0xFF3064AB),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Center(
              child: Text(
                'Schedule Date',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: InkWell(
            onTap: () => Get.back(),
            child: Container(
              height: 44.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Center(
                child: Text(
                  'Discard',
                  style: TextStyle(
                    color: const Color(0xFF111928),
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
