import 'package:flutter/material.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../core/utils/size_utils.dart';

class AddAgeGroupView extends StatefulWidget {
  const AddAgeGroupView({super.key});

  @override
  State<AddAgeGroupView> createState() => _AddAgeGroupViewState();
}

class _AddAgeGroupViewState extends State<AddAgeGroupView> {
  String _selectedAgeGroup = "U10";
  int _weeklySessions = 3;
  final Set<int> _selectedDayIndices = {0}; // Default M selected
  String _selectedDuration = "Medium (90 min)";
  String _selectedIntensity = "Medium";

  final List<String> _weekDays = ["M", "T", "W", "T", "F", "S", "S"];

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "Add Age Group",
      showBackButton: true,
      backgroundColor: const Color(0xFFEDF5FF),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionLabel("Age Group"),
            SizedBox(height: 8.h),
            _buildDropdown(
              value: _selectedAgeGroup,
              items: ["U10", "U12", "U14", "U16", "U18"],
              onChanged: (val) => setState(() => _selectedAgeGroup = val!),
            ),
            SizedBox(height: 16.h),

            _buildSectionLabel("Weekly Session"),
            SizedBox(height: 8.h),
            _buildCounter(),
            SizedBox(height: 16.h),

            _buildSectionLabel("Schedule Days"),
            SizedBox(height: 8.h),
            _buildDaySelector(),
            SizedBox(height: 16.h),

            _buildSectionLabel("Duration"),
            SizedBox(height: 8.h),
            _buildDropdown(
              value: _selectedDuration,
              items: ["Low (60 min)", "Medium (90 min)", "High (120 min)"],
              onChanged: (val) => setState(() => _selectedDuration = val!),
            ),
            SizedBox(height: 16.h),

            _buildSectionLabel("Intensity"),
            SizedBox(height: 8.h),
            _buildDropdown(
              value: _selectedIntensity,
              items: ["Low", "Medium", "High"],
              onChanged: (val) => setState(() => _selectedIntensity = val!),
            ),
            SizedBox(height: 40.h),

            Center(child: _buildSaveButton()),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        color: const Color(0xFF012356),
        fontSize: 16.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 48.h,
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
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF012356)),
          isExpanded: true,
          style: TextStyle(
            color: const Color(0xFF012356),
            fontSize: 16.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
          items: items.map((String item) {
            // Handle rich text for duration if needed, but simple text works for now per design
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildCounter() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
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
        mainAxisAlignment:
            MainAxisAlignment.center, // As per design, centered-ish
        children: [
          InkWell(
            onTap: () {
              if (_weeklySessions > 0) setState(() => _weeklySessions--);
            },
            child: Text(
              '-',
              style: TextStyle(
                color: const Color(0xFF012356),
                fontSize: 36.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(width: 40.w), // Space around count
          Text(
            '$_weeklySessions',
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 36.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 40.w),
          InkWell(
            onTap: () {
              setState(() => _weeklySessions++);
            },
            child: Text(
              '+',
              style: TextStyle(
                color: const Color(0xFF012356),
                fontSize: 36.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDaySelector() {
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(_weekDays.length, (index) {
          final day = _weekDays[index];
          final isSelected = _selectedDayIndices.contains(index);

          return GestureDetector(
            onTap: () {
              setState(() {
                if (isSelected) {
                  _selectedDayIndices.remove(index);
                } else {
                  _selectedDayIndices.add(index);
                }
              });
            },
            child: _buildDayCircle(day, isSelected),
          );
        }),
      ),
    );
  }

  Widget _buildDayCircle(String day, bool isSelected) {
    return Container(
      width: 36.w,
      height: 36.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? const Color(0xFF19305A) : Colors.transparent,
        border: isSelected
            ? null
            : Border.all(color: const Color(0x33012356), width: 1),
      ),
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF012356),
            fontSize: 16.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFF046BDA), // Blue from design
        borderRadius: BorderRadius.circular(4.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0x28000000),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        'Save Frequency',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
