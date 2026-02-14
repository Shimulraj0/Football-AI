import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../../core/utils/size_utils.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/communication_hub_controller.dart';
import '../../../routes/app_routes.dart';
// Assuming controller exists, otherwise I'll need to check if I should use Get.put or find

class AiCommunicationView extends GetView<CommunicationHubController> {
  const AiCommunicationView({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller is provided by CommunicationHubBinding

    return BaseScaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      showHeader: true,

      headerContent: Container(
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 24.h, left: 20.w, right: 20.w),
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
              blurRadius: 10.r,
              offset: Offset(0, 4.h),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Content
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 51.w,
                      height: 51.w,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          // Using placeholder or asset if available.
                          // Snippet used network image, I'll use asset if possible or network as fallback
                          image: const AssetImage('assets/icons/Ellipse13.png'),
                          fit: BoxFit.cover,
                        ),
                        shape: OvalBorder(
                          side: const BorderSide(width: 1, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 150.w,
                          child: Text(
                            'Welcome Back',
                            style: TextStyle(
                              color: const Color(0xFFFEFEFE),
                              fontSize: 18.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          'AI Communication Hub',
                          style: TextStyle(
                            color: const Color(0xFFFEFEFE),
                            fontSize: 12.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 38.w,
                  height: 38.w,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFEFEFE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/icons/Notification.svg",
                      width: 24.w,
                      height: 24.w,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF012355),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            _buildAiOptionCard(
              title: "Coach AI",
              subtitle: "Plan session & drills",
              iconAsset: "assets/images/CoachAI.png",
              isSvg: false,
              onTap: () => Get.toNamed(
                AppRoutes.aiCommunication,
                arguments: {'title': 'Coach AI'},
              ),
            ),
            SizedBox(height: 16.h),
            _buildAiOptionCard(
              title: "Player AI",
              subtitle: "Personalized feedback",
              iconAsset: "assets/images/PlayerAI.png",
              isSvg: false,
              onTap: () => Get.toNamed(
                AppRoutes.aiCommunication,
                arguments: {'title': 'Player AI'},
              ),
            ),
            SizedBox(height: 16.h),
            _buildAiOptionCard(
              title: "Parent AI",
              subtitle: "Updates & logistics",
              iconAsset: "assets/images/ParentAI.png",
              isSvg: false,
              // Fallback to group icon for parent
              onTap: () => Get.toNamed(
                AppRoutes.aiCommunication,
                arguments: {'title': 'Parent AI'},
              ),
            ),
            SizedBox(height: 16.h),
            _buildAiOptionCard(
              title: "TD AI",
              subtitle: "Club methodology & strategy",
              iconAsset: "assets/images/TDAI.png",
              isSvg: false,
              onTap: () => Get.toNamed(
                AppRoutes.aiCommunication,
                arguments: {'title': 'TD AI'},
              ),
            ),
            SizedBox(height: 16.h),
            _buildAiOptionCard(
              title: "DOC AI",
              subtitle: "Speciality Director AI",
              iconAsset: "assets/images/DOCAI.png",
              isSvg: false,
              onTap: () => Get.toNamed(
                AppRoutes.aiCommunication,
                arguments: {'title': 'DOC AI'},
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: 0, // Home selected as per snippet
        onItemTapped: (index) {
          if (Get.isRegistered<HomeController>()) {
            Get.find<HomeController>().changeTabIndex(index);
            if (index != 0) {
              Get.back(); // If logic requires returning to main home
            }
          }
        },
      ),
    );
  }

  Widget _buildAiOptionCard({
    required String title,
    required String subtitle,
    required String iconAsset,
    required VoidCallback onTap,
    bool isSvg = false,
  }) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Colors.transparent, // Background handled by Material
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        shadows: [
          BoxShadow(
            color: const Color(0x28000000),
            blurRadius: 6.r,
            offset: Offset(0, 3.h),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: const Color(0xFFFEFEFE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 48.w,
                      height: 48.w,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF9F9F9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Center(
                        child: isSvg
                            ? SvgPicture.asset(
                                iconAsset,
                                width: 24.w,
                                height: 24.w,
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFF575757),
                                  BlendMode.srcIn,
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: Image.asset(
                                  iconAsset,
                                  width: 48.w,
                                  height: 48.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        SizedBox(height: 4.h),
                        Text(
                          subtitle,
                          style: TextStyle(
                            color: const Color(
                              0xFF012356,
                            ).withValues(alpha: 0.6),
                            fontSize: 12.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.chevron_right,
                  color: const Color(0xFF012356),
                  size: 24.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
