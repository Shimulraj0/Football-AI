import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../controllers/ai_communication_controller.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../home/controllers/home_controller.dart';
import '../../../../global_widgets/custom_back_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AiCommunicationView extends GetView<AiCommunicationController> {
  const AiCommunicationView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) return;

        // Handle navigation state sync
        if (Get.isRegistered<HomeController>()) {
          final homeController = Get.find<HomeController>();
          // If coming from another tab, switch back to home
          if (homeController.selectedIndex.value != 0) {
            homeController.changeTabIndex(0);
            return;
          }
        }

        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop(result);
        } else {
          Get.back(result: result);
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F7FF),
        body: Column(
          children: [
            _buildCustomHeader(),
            Expanded(
              child: Obx(() {
                if (controller.messages.isEmpty) {
                  return _buildSuggestionList();
                }
                return ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final message = controller.messages[index];
                    return _buildMessageBubble(message);
                  },
                );
              }),
            ),
            _buildInputArea(context),
          ],
        ),
        bottomNavigationBar: () {
          if (Get.isRegistered<HomeController>()) {
            final homeController = Get.find<HomeController>();
            return Obx(
              () => CustomBottomNavBar(
                selectedIndex: homeController.selectedIndex.value,
                onItemTapped: homeController.changeTabIndex,
              ),
            );
          }
          return null;
        }(),
      ),
    );
  }

  Widget _buildCustomHeader() {
    return Container(
      height: 140.h,
      decoration: const BoxDecoration(
        color: Color(0xFF012355),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      padding: EdgeInsets.only(
        top: 40.h,
        left: 20.w,
        right: 20.w,
        bottom: 20.h,
      ),
      child: Row(
        children: [
          CustomBackButton(
            backgroundColor: Colors.white,
            iconColor: const Color(0xFF012355),
            onPressed: () {
              if (Get.isRegistered<HomeController>()) {
                final homeController = Get.find<HomeController>();
                if (homeController.selectedIndex.value != 0) {
                  homeController.changeTabIndex(0);
                  return;
                }
              }
              Get.back();
            },
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(right: 40.w),
                child: Text(
                  Get.arguments != null &&
                          Get.arguments is Map &&
                          Get.arguments.containsKey('title')
                      ? Get.arguments['title']
                      : 'Coach AI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionList() {
    final suggestions = controller.suggestedQuestions;
    // Map titles to specific icons based on the design requirement
    // In a real app, this data should come from the model/controller
    final Map<String, String> iconMap = {
      // Coach AI
      "Player Feedback": "assets/icons/Membership.svg",
      "Drill Library Search": "assets/icons/Grou.svg",
      "Feedback Ideas": "assets/icons/Settings.svg",
      "Team Performance Review": "assets/icons/Grouping.svg",

      // Parent AI
      "Skill Development Tips":
          "assets/icons/Membership.svg", // Reusing for now
      "Nutrition & Recovery Advice": "assets/icons/Grou.svg", // Reusing for now
      "Team Schedule & Updates": "assets/icons/Grouping.svg",

      // Player AI (added previously, missed in this view range)
      "Skill Drill Ideas": "assets/icons/Membership.svg",
      "Ask About Tactics": "assets/icons/Settings.svg",
      "Coach Announcements": "assets/icons/ChatBubble.png",

      // TD AI
      "Facility Optimization": "assets/icons/Membership.svg",
      "View Financial Trend": "assets/icons/Grou.svg",
      "Curriculum Gap Analysis": "assets/icons/Grouping.svg",

      // DOC AI
      "Staff Performance": "assets/icons/Membership.svg",
      "Curriculum Compliance": "assets/icons/Grou.svg",
      "Evaluation Builder": "assets/icons/Grouping.svg",
      "Professional Development": "assets/icons/Settings.svg",
    };

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: 150.h, // Adjusted top padding
        left: 0.w, // Removed left padding for alignment
        right: 20.w,
        bottom: 20.h,
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align suggestions to start
        children: suggestions.map((suggestion) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: _buildSuggestionCard(
              suggestion,
              iconMap[suggestion] ?? "assets/icons/ChatBubble.png",
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSuggestionCard(String title, String iconPath) {
    return GestureDetector(
      onTap: () => controller.sendSuggestedQuestion(title),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: ShapeDecoration(
          color: const Color(0xFFCADFFA),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows: const [
            BoxShadow(
              color: Color(0x28000000),
              blurRadius: 6,
              offset: Offset(0, 3),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 34,
              height: 34,
              padding: const EdgeInsets.all(5),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: iconPath.endsWith('.svg')
                  ? SvgPicture.asset(
                      iconPath,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF575757),
                        BlendMode.srcIn,
                      ),
                    )
                  : Image.asset(iconPath),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF012356),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        constraints: BoxConstraints(maxWidth: Get.width * 0.75),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: message.isUser ? const Color(0xFF012355) : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.w),
            topRight: Radius.circular(16.w),
            bottomLeft: message.isUser ? Radius.circular(16.w) : Radius.zero,
            bottomRight: message.isUser ? Radius.zero : Radius.circular(16.w),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: TextStyle(
                color: message.isUser ? Colors.white : const Color(0xFF1F1D1D),
                fontSize: 14.sp,
                fontFamily: 'Inter',
                height: 1.5,
              ),
            ),
            SizedBox(height: 4.h),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                message.time,
                style: TextStyle(
                  color: message.isUser
                      ? Colors.white70
                      : const Color(0xFF888888),
                  fontSize: 10.sp,
                  fontFamily: 'Inter',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputArea(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      // No outer decoration - transparent container to match floating look
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x28000000),
                  blurRadius: 6.r,
                  offset: Offset(0, 3.h),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.messageController,
                    style: TextStyle(
                      color: const Color(0xFF012356),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      height: 1.1,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Type your prompt....',
                      hintStyle: TextStyle(
                        color: const Color(0x66012356),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: controller.sendMessage,
                  child: Container(
                    width: 24.w,
                    height: 24.w,
                    decoration: const BoxDecoration(
                      color: Colors.transparent, // Icon only
                    ),
                    child: Icon(
                      Icons.send_rounded, // Standard icon
                      color: const Color(0xFF012356),
                      size: 24.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
