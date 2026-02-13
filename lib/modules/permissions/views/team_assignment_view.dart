import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/custom_back_button.dart';

class TeamAssignmentView extends StatefulWidget {
  const TeamAssignmentView({super.key});

  @override
  State<TeamAssignmentView> createState() => _TeamAssignmentViewState();
}

class _TeamAssignmentViewState extends State<TeamAssignmentView> {
  String selectedTeam = 'U13 Boys';
  String selectedSubTeam = 'U13 Boys Premier';

  final List<String> subTeams = [
    "U13 Boys Premier",
    "U13 Boys Silver",
    "U13 Boys Gold",
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      headerHeight: 90.h,
      headerContent: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
                'Team Assignment',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(width: 44.w), // Balance back button
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF9F9F9),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              SizedBox(height: 24.h),
              _buildSectionTitle("Select Team"),
              SizedBox(height: 8.h),
              _buildDropdownCard(
                value: selectedTeam,
                items: ["U13 Boys", "U14 Boys", "U15 Boys"],
                onChanged: (val) {
                  if (val != null) setState(() => selectedTeam = val);
                },
              ),
              SizedBox(height: 24.h),
              _buildSectionTitle("Select Team"),
              SizedBox(height: 16.h),
              ...subTeams.map(
                (team) => Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: _buildTeamItem(
                    team,
                    isSelected: selectedSubTeam == team,
                    onTap: () => setState(() => selectedSubTeam = team),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              _buildSectionTitle("Select Coach"),
              SizedBox(height: 16.h),
              _buildCoachCard(),
              SizedBox(height: 40.h),
              _buildAssignButton(),
              SizedBox(height: 20.h),
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

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: ShapeDecoration(
        color: Colors.white,
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
        children: [
          Icon(Icons.search, color: const Color(0xFF9E9E9E), size: 24.w),
          SizedBox(width: 4.w),
          Expanded(
            child: Text(
              'Search name',
              style: TextStyle(
                color: const Color(0x66012356),
                fontSize: 14.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 1.10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownCard({
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 4.h,
      ), // adjusted padding
      decoration: ShapeDecoration(
        color: Colors.white,
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
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down, color: const Color(0xFF012356)),
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

  Widget _buildTeamItem(
    String title, {
    bool isSelected = false,
    VoidCallback? onTap,
  }) {
    final backgroundColor = isSelected
        ? const Color(0xFF324D90)
        : Colors.white; // 324D90 from snippet
    final textColor = isSelected ? Colors.white : const Color(0xFF012356);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          shadows: isSelected
              ? []
              : [
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
              child: Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_box,
                color: Colors.white,
                size: 24.w,
              ) // Placeholder for checked box
            else
              Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF012356), width: 2),
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoachCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: ShapeDecoration(
        color: Colors.white,
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
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/321.png"),
                fit: BoxFit.cover,
              ),
              shape: OvalBorder(),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Emily Warner',
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Head Coach',
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            decoration: ShapeDecoration(
              color: const Color(0xFFE8EBFB),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
            child: Text(
              'Change',
              style: TextStyle(
                color: const Color(0xFF012356),
                fontSize: 12.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssignButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          // Implement assignment logic here
          Get.back();
        },
        child: Container(
          width: 240.w,
          padding: EdgeInsets.all(10.w),
          decoration: ShapeDecoration(
            color: const Color(0xFF3064AB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Assign $selectedSubTeam',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
