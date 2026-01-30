import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../global_widgets/custom_back_button.dart';
import '../controllers/add_observation_notes_controller.dart';

class AddObservationNotesView extends GetView<AddObservationNotesController> {
  const AddObservationNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      headerContent: _buildHeader(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSessionInfoCard(),
              SizedBox(height: 16.h),
              _buildFocusAreasAndNotesCard(context),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.saveObservation(),
                      child: _buildButton(
                        text: "Save Observation",
                        backgroundColor: const Color(0xFF1A3A6E),
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.saveObservation(),
                      child: _buildButton(
                        text: "Save & Add Observation",
                        backgroundColor: const Color(0xFFCFDAF5),
                        textColor: const Color(0xFF012356),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomBackButton(
                onPressed: () => Get.back(),
                backgroundColor: const Color(0xFFE8F3FF),
                iconColor: const Color(0xFF00204A),
              ),
              Text(
                'Add Observation Notes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 40.w), // Balance back button
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSessionInfoCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0x28000000),
            blurRadius: 6.w,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'U9 Boys Premier',
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 8.h),
          Divider(color: const Color(0xFFE0E0E0), height: 1.h),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Coach Rahim',
                style: TextStyle(
                  color: const Color(0xFF012356),
                  fontSize: 14.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'Mon, April 2, 5:00 PM',
                style: TextStyle(
                  color: const Color(0x99012356),
                  fontSize: 14.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Session Type: ',
                  style: TextStyle(
                    color: const Color(0xFF012356),
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: 'Training',
                  style: TextStyle(
                    color: const Color(0xB2012356),
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFocusAreasAndNotesCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0x28000000),
            blurRadius: 6.w,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Focus Areas',
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 12.h),
          Obx(() {
            return Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: controller.focusAreas.map((area) {
                final isSelected = controller.selectedFocusAreas.contains(area);
                return GestureDetector(
                  onTap: () => controller.toggleFocusArea(area),
                  child: _buildChip(
                    area,
                    isSelected
                        ? const Color(0xFF1E68CE)
                        : const Color(0xFFF0F0F3),
                    isSelected ? Colors.white : const Color(0xFF012356),
                    icon: _getIconForFocusArea(area),
                  ),
                );
              }).toList(),
            );
          }),
          SizedBox(height: 16.h),
          Divider(color: const Color(0xFFE0E0E0), height: 1.h),
          SizedBox(height: 16.h),
          Text(
            'Observation Notes',
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 8.h),
          TextField(
            controller: controller.observationNotesController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Enter observation notes here...',
              hintStyle: TextStyle(
                color: const Color(0xFF012356).withValues(alpha: 0.5),
                fontSize: 14.sp,
                fontFamily: 'Inter',
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.w),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.w),
                borderSide: const BorderSide(color: Color(0xFF1E68CE)),
              ),
            ),
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 14.sp,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 16.h),
          Divider(color: const Color(0xFFE0E0E0), height: 1.h),
          SizedBox(height: 16.h),
          Text(
            'Strength Observed',
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 8.h),
          Obx(
            () => Wrap(
              spacing: 16.w,
              runSpacing: 8.h,
              children: controller.strengths
                  .map(
                    (str) => _buildDotItem(str, () {
                      // Logic to remove if needed, assuming index access or pass item
                    }),
                  )
                  .toList(),
            ),
          ),
          SizedBox(height: 8.h),
          GestureDetector(
            onTap: () =>
                _showAddDialog(context, 'Add Strength', controller.addStrength),
            child: _buildActionItem('Add Strength', Icons.add),
          ),
          SizedBox(height: 16.h),
          Divider(color: const Color(0xFFE0E0E0), height: 1.h),
          SizedBox(height: 16.h),
          Text(
            'Areas to Improve',
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 8.h),
          Obx(
            () => Wrap(
              spacing: 16.w,
              runSpacing: 8.h,
              children: controller.areasToImprove
                  .map((area) => _buildDotItem(area, () {}))
                  .toList(),
            ),
          ),
          SizedBox(height: 8.h),
          GestureDetector(
            onTap: () => _showAddDialog(
              context,
              'Add Improvement',
              controller.addAreaToImprove,
            ),
            child: _buildActionItem('Add improvement', Icons.add),
          ),
        ],
      ),
    );
  }

  IconData _getIconForFocusArea(String area) {
    switch (area) {
      case 'Technique':
        return Icons.sports_soccer;
      case 'Tactical Awareness':
        return Icons.psychology;
      case 'Physical':
        return Icons.directions_run;
      case 'Confidence':
        return Icons.lightbulb_outline;
      default:
        return Icons.star;
    }
  }

  void _showAddDialog(
    BuildContext context,
    String title,
    Function(String) onAdd,
  ) {
    final textController = TextEditingController();
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.w),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF012356),
                ),
              ),
              SizedBox(height: 16.h),
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: 'Enter item...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Text('Cancel'),
                  ),
                  SizedBox(width: 8.w),
                  ElevatedButton(
                    onPressed: () {
                      if (textController.text.isNotEmpty) {
                        onAdd(textController.text);
                        Get.back();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1A3A6E),
                    ),
                    child: const Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(String label, Color bg, Color text, {IconData? icon}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(4.w),
        border: bg == const Color(0xFFF0F0F3)
            ? Border.all(color: Colors.black.withValues(alpha: 0.1), width: 0.5)
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14.w, color: text),
            SizedBox(width: 4.w),
          ],
          Text(
            label,
            style: TextStyle(
              color: text,
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDotItem(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap, // Could be used to remove later
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6.w,
            height: 6.w,
            decoration: const BoxDecoration(
              color: Color(0xFF012356),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 4.w),
          Text(
            text,
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

  Widget _buildActionItem(String text, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF1A56DB), size: 16.w),
        SizedBox(width: 4.w),
        Text(
          text,
          style: TextStyle(
            color: const Color(0xFF1A56DB),
            fontSize: 14.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildButton({
    required String text,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 14.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
