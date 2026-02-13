import 'package:flutter/material.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../core/utils/size_utils.dart';

class AddNewTierView extends StatefulWidget {
  const AddNewTierView({super.key});

  @override
  State<AddNewTierView> createState() => _AddNewTierViewState();
}

class _AddNewTierViewState extends State<AddNewTierView> {
  // State for Color Picker
  final List<Color> _colors = const [
    Color(0xFF19305A),
    Color(0xFFF03E3E),
    Color(0xFF1AB375),
    Color(0xFFF8D532),
    Color(0xFF83CAF4),
  ];
  late Color _selectedColor;

  // State for Dropdown (Priority)
  String _selectedPriority = "Tier 1";

  @override
  void initState() {
    super.initState();
    _selectedColor = _colors[0];
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "Add New Tier",
      showBackButton: true,
      backButtonBackgroundColor: Colors.white,
      backButtonIconColor: const Color(0xFF012356),
      backgroundColor: const Color(0xFFEDF5FF),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel("Tier Name"),
              SizedBox(height: 8.h),
              _buildTextField(hintText: "write name"),
              SizedBox(height: 24.h),

              _buildLabel("Tier Name"),
              SizedBox(height: 12.h),
              _buildColorPicker(),
              SizedBox(height: 24.h),

              _buildLabel("Priority/Ranking"),
              SizedBox(height: 8.h),
              _buildDropdown(
                value: _selectedPriority,
                items: ["Tier 1", "Tier 2", "Tier 3"],
                onChanged: (val) {
                  if (val != null) setState(() => _selectedPriority = val);
                },
              ),
              SizedBox(height: 24.h),

              _buildLabel("Tier Description"),
              SizedBox(height: 8.h),
              _buildTextField(hintText: "Give description", maxLines: 3),
              SizedBox(height: 24.h),

              _buildLabel("Age Groups"),
              SizedBox(height: 8.h),
              _buildAgeGroupSelector(),
              SizedBox(height: 40.h),

              Center(child: _buildSaveButton()),
              SizedBox(height: 20.h),
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
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildTextField({required String hintText, int maxLines = 1}) {
    return Container(
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
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: const Color(0x66012356),
            fontSize: 14.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16.w),
        ),
      ),
    );
  }

  Widget _buildColorPicker() {
    return Row(
      children: _colors.asMap().entries.map((entry) {
        final color = entry.value;
        final isSelected = color == _selectedColor;

        return Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedColor = color;
              });
            },
            child: Container(
              width: isSelected ? 44.w : 36.w,
              height: isSelected ? 44.w : 36.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: isSelected ? Border.all(color: color, width: 2) : null,
              ),
              padding: EdgeInsets.all(4.w),
              child: Container(
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
            ),
          ),
        );
      }).toList(),
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
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildAgeGroupSelector() {
    return Container(
      padding: EdgeInsets.all(12.w),
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
      child: InkWell(
        onTap: () {
          // Open selector logic
        },
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey, size: 24.w),
            SizedBox(width: 8.w),
            Text(
              'Find & select age group',
              style: TextStyle(
                color: const Color(0x66012356),
                fontSize: 14.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return InkWell(
      onTap: () {
        // Save logic
      },
      child: Container(
        width: 107.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: const Color(0xFF3064AB),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            'Save',
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
