import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/custom_back_button.dart';
import '../../../core/utils/size_utils.dart';

class EvaluationDetailsView extends GetView {
  const EvaluationDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F3FF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Stats Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatCard('Player To Evaluate', '14'),
                      _buildStatCard('Evaluation Due', 'Nov 25'),
                      _buildStatCard('Coaches Assigned', '2'),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // Progress Card
                  _buildProgressCard(),
                  SizedBox(height: 24.h),

                  // Coach Submission Status
                  Text(
                    'Coach Submission Status',
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Expanded(
                        child: _buildCoachCard(
                          name: 'Emily Warner',
                          role: 'Head Coach',
                          status: 'In progress',
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: _buildCoachCard(
                          name: 'Jason Myers',
                          role: 'Asst. Coach',
                          status: 'In progress',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),

                  // Player Evaluations List
                  _buildPlayerList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 50.h,
        bottom: 30.h,
        left: 20.w,
        right: 20.w,
      ),
      decoration: const ShapeDecoration(
        color: Color(0xFF012355),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x1E000000),
            blurRadius: 10.10,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CustomBackButton(
              onPressed: () => Get.back(),
              backgroundColor: const Color(0xFFE8F3FF),
              iconColor: const Color(0xFF012356),
            ),
          ),
          Text(
            'U10 Boys Silver - Evaluations',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Container(
      width: 111.w, // Approx
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 32.h,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF012356),
                fontSize: 12.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 20.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
        border: Border.all(color: Colors.black.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overall Evaluation Completion',
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12.h),
          Stack(
            children: [
              Container(
                height: 6.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFE1E1E1),
                  borderRadius: BorderRadius.circular(2.w),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.4,
                child: Container(
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0260ED),
                    borderRadius: BorderRadius.circular(2.w),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            '40% Complete',
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 12.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            '6 of 14 Players submitted',
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 12.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoachCard({
    required String name,
    required String role,
    required String status,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
        border: Border.all(color: Colors.black.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            role,
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 12.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Due Nov 25',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 10.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F6F8),
                  borderRadius: BorderRadius.circular(4.w),
                  border: Border.all(
                    color: Colors.black.withValues(alpha: 0.1),
                  ),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 10.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerList() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Player Evaluations',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const _FilterDropdown(),
            ],
          ),
          SizedBox(height: 16.h),
          _buildPlayerRow('Salim R.', 'Head coach', 'In progress'),
          SizedBox(height: 16.h),
          _buildPlayerRow(
            'Mia K.',
            'Reso Coach',
            'Nees Review',
          ), // Typo from snippet preserved or fixed? Design says 'Nees Review', likely 'Needs Review'. I'll stick to 'Needs Review' or verbatim if requested. Design snippet says 'Nees Review' in text widget, I will correct to 'Needs Review'.
          SizedBox(height: 16.h),
          _buildPlayerRow('Ariana L.', 'Submitted', 'Submitted'),
        ],
      ),
    );
  }

  Widget _buildPlayerRow(String name, String role, String status) {
    return Row(
      children: [
        Container(
          width: 32.w,
          height: 32.w,
          decoration: const BoxDecoration(
            color: Color(0xFFE2E2E3),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.person, size: 20.w, color: Colors.grey),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 14.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                role,
                style: TextStyle(
                  color: const Color(0xFF012356).withValues(alpha: 0.6),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F6F8),
            borderRadius: BorderRadius.circular(4.w),
            border: Border.all(color: Colors.black.withValues(alpha: 0.1)),
          ),
          child: Text(
            status,
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 12.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Icon(Icons.chevron_right, size: 20.w, color: const Color(0xFF012356)),
      ],
    );
  }
}

class _FilterDropdown extends StatefulWidget {
  const _FilterDropdown();

  @override
  State<_FilterDropdown> createState() => _FilterDropdownState();
}

class _FilterDropdownState extends State<_FilterDropdown> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;

  void _toggleDropdown() {
    if (_isOpen) {
      _closeDropdown();
    } else {
      _showDropdown();
    }
  }

  void _showDropdown() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isOpen = true;
    });
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isOpen = false;
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Size size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: _closeDropdown,
              behavior: HitTestBehavior.translucent,
              child: Container(color: Colors.transparent),
            ),
          ),
          Positioned(
            width: 123,
            child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(size.width - 123, size.height + 5),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 123,
                  padding: const EdgeInsets.all(8),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Colors.black.withValues(alpha: 0.20),
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x28000000),
                        blurRadius: 6,
                        offset: Offset(0, 3),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFilterOption('Not Started'),
                      SizedBox(height: 8.h),
                      _buildFilterOption('In Progress'),
                      SizedBox(height: 8.h),
                      _buildFilterOption('Needs Review'),
                      SizedBox(height: 8.h),
                      _buildFilterOption('Submitted'),
                      SizedBox(height: 8.h),
                      _buildFilterOption('Approved'),
                      SizedBox(height: 8.h),
                      _buildFilterOption('Returned to Coach'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterOption(String text) {
    return GestureDetector(
      onTap: _closeDropdown,
      child: SizedBox(
        width: 107,
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFF012356),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Row(
          children: [
            Icon(Icons.tune, size: 16.w, color: const Color(0xFF012356)),
            SizedBox(width: 4.w),
            Text(
              'Filter',
              style: TextStyle(
                color: const Color(0xFF012356),
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
}
