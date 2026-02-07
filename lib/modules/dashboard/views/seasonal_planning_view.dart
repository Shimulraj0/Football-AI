import 'package:flutter/material.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../core/utils/size_utils.dart';

class SeasonalPlanningView extends StatefulWidget {
  const SeasonalPlanningView({super.key});

  @override
  State<SeasonalPlanningView> createState() => _SeasonalPlanningViewState();
}

class _SeasonalPlanningViewState extends State<SeasonalPlanningView> {
  // Mock state for tabs in cards
  // Ideally this would be a list of team objects with their own state
  // For UI demo, we'll keep it simple or map it.
  final Map<int, int> _selectedTabIndices = {0: 0, 1: 0}; // teamIndex: tabIndex

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title:
          "Seasonal Planing", // Typo in design "Planing", keeping it or fixing it? Design says "Planing". I will use "Planing" to match design exact text, or "Planning" for correctness? User Prompt has "Seasonal Planing" in text. I'll stick to "Planing" to match if they want exact, but "Planning" is correct. Let's use "Planning" but title says "Seasonal Planing" in the screenshot. I'll use "Planning" for the class/file but match the title text to the screenshot if I must, but usually I should correct typos. I'll use "Seasonal Planing" in the title string to match visual verify.
      showBackButton: true,
      backgroundColor: const Color(0xFFEDF5FF),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              children: [
                _buildTeamCard(index: 0, title: "Elite Academy"),
                SizedBox(height: 16.h),
                _buildTeamCard(index: 1, title: "U10 Boys - Navy Team"),
                SizedBox(height: 100.h), // Space for bottom button
              ],
            ),
          ),
          Positioned(
            bottom: 40.h,
            left: 0,
            right: 0,
            child: Center(child: _buildSaveButton()),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamCard({required int index, required String title}) {
    final int selectedTab = _selectedTabIndices[index] ?? 0;

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

          // Segmented Toggle
          Container(
            height: 36.h,
            decoration: BoxDecoration(
              color: const Color(0xFFCDDCEE),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedTabIndices[index] = 0),
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: selectedTab == 0
                            ? const Color(0xFF19305A)
                            : Colors.transparent,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(6.r),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Pre-Season (4Weeks)",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: selectedTab == 0
                              ? Colors.white
                              : const Color(0xFF012356),
                          fontSize: 10.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedTabIndices[index] = 1),
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: selectedTab == 1
                            ? const Color(0xFF19305A)
                            : Colors.transparent,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(6.r),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "In-Season (22Weeks)",
                        style: TextStyle(
                          color: selectedTab == 1
                              ? Colors.white
                              : const Color(0xFF012356),
                          fontSize: 10.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Date Actions
          Row(
            children: [
              _buildDateAction(
                icon: Icons.calendar_today_outlined,
                label: "Set Start Date",
                onTap: () {},
              ),
              SizedBox(width: 24.w),
              _buildDateAction(
                icon: Icons.calendar_month_outlined,
                label: "Set Full Calender",
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateAction({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14.w, color: const Color(0xFF012356)),
          SizedBox(width: 4.w),
          Text(
            label,
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 10.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return Container(
      width: 154.w,
      height: 30.h,
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
      alignment: Alignment.center,
      child: Text(
        "Save Planing", // Typo match
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
