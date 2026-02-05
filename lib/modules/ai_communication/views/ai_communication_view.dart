import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_utils.dart';
import '../controllers/ai_communication_controller.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../home/controllers/home_controller.dart';
import '../../../../global_widgets/custom_back_button.dart';

class AiCommunicationView extends GetView<AiCommunicationController> {
  const AiCommunicationView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }

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
        // Using Scaffold directly for custom header design or wrapping body
        backgroundColor: const Color(
          0xFFF3F7FF,
        ), // Light blue background from image
        body: Column(
          children: [
            _buildCustomHeader(),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final message = controller.messages[index];
                    return _buildMessageBubble(message);
                  },
                ),
              ),
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
      height: 140.h, // Adjusted height
      decoration: const BoxDecoration(
        color: Color(0xFF012355), // Dark Blue
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
                padding: EdgeInsets.only(right: 40.w), // Balance back button
                child: Text(
                  'Coach AI',
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
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
              child: TextField(
                controller: controller.messageController,
                decoration: InputDecoration(
                  hintText: 'Type your message...',
                  hintStyle: TextStyle(
                    color: const Color(0xFF888888),
                    fontSize: 14.sp,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: controller.sendMessage,
            child: Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: const Color(0xFF012355),
                borderRadius: BorderRadius.circular(
                  12,
                ), // Rounded square as per image
              ),
              child: Center(
                child: Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                  size: 20.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
