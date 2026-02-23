import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PeriodizationIntegrationController extends GetxController {
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final Rx<DateTime> displayedMonth = DateTime(
    DateTime.now().year,
    DateTime.now().month,
  ).obs;

  final RxBool isAddingTask = false.obs;

  void toggleAddTask() {
    isAddingTask.value = !isAddingTask.value;
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;
  }

  void previousMonth() {
    displayedMonth.value = DateTime(
      displayedMonth.value.year,
      displayedMonth.value.month - 1,
    );
  }

  void nextMonth() {
    displayedMonth.value = DateTime(
      displayedMonth.value.year,
      displayedMonth.value.month + 1,
    );
  }

  void goToToday() {
    final now = DateTime.now();
    selectedDate.value = now;
    displayedMonth.value = DateTime(now.year, now.month);
  }

  void clearSelection() {
    // Keep displayed month but reset selection or maybe just go to today?
    // Usually "Clear" might clear filters. For a calendar, let's just reset to now.
    goToToday();
  }

  String get formattedMonthYear {
    return DateFormat('MMMM yyyy').format(displayedMonth.value);
  }

  String get formattedSelectedDateLabel {
    return "${DateFormat('E, d').format(selectedDate.value)}${_getDaySuffix(selectedDate.value.day)}";
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  // Generate calendar days
  List<DateTime?> get calendarDays {
    final int year = displayedMonth.value.year;
    final int month = displayedMonth.value.month;

    // First day of the month
    final firstDay = DateTime(year, month, 1);

    // Day of the week of the first day (1 = Monday, 7 = Sunday)
    // Dart's DateTime considers Monday as 1, Sunday as 7.
    // However, our calendar starts on Sunday.
    // So if firstDay.weekday is 7 (Sunday), offset is 0.
    // If it's 1 (Monday), offset is 1, etc.
    final int firstDayOffset = firstDay.weekday == 7 ? 0 : firstDay.weekday;

    final int daysInMonth = DateTime(
      year,
      month + 1,
      0,
    ).day; // 0th day of next month is last day of current month

    final List<DateTime?> days = [];

    // Add empty slots for days before the 1st
    for (int i = 0; i < firstDayOffset; i++) {
      days.add(null);
    }

    // Add the days of the month
    for (int i = 1; i <= daysInMonth; i++) {
      days.add(DateTime(year, month, i));
    }

    return days;
  }

  // Mock data for the schedule card based on selected date
  String get currentDailySchedule {
    if (selectedDate.value.weekday == DateTime.saturday ||
        selectedDate.value.weekday == DateTime.sunday) {
      return 'Game';
    } else if (selectedDate.value.weekday == DateTime.wednesday) {
      return 'Rest Recovery';
    }
    return 'Training';
  }

  String get currentTeamFunction {
    if (selectedDate.value.weekday == DateTime.tuesday) {
      return 'Attacking';
    }
    return 'Defending';
  }

  String get currentPhysicalFocus {
    if (selectedDate.value.weekday == DateTime.thursday) {
      return '11v11';
    }
    return '5v5/7v7';
  }

  String get currentPhysicalDemand {
    if (selectedDate.value.weekday == DateTime.friday) {
      return 'Activation: 40% Capacity';
    }
    return 'Fitness:90% Capacity';
  }
}
