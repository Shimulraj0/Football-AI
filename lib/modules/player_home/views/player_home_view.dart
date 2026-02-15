import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/player_home_controller.dart';
import '../widgets/player_menu_section.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/base_scaffold.dart';
import '../../home/controllers/home_controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../core/utils/size_utils.dart';

class PlayerHomeView extends GetView<PlayerHomeController> {
  const PlayerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<HomeController>()) {
      Get.find<HomeController>().currentHomeRoute.value = AppRoutes.playerHome;
    }

    return BaseScaffold(
      backgroundColor: AppColors.background,
      headerContent: _buildHeader(),
      body: const PlayerMenuSection(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 51.w,
                height: 51.w,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/icons/Ellipse13.png'),
                    fit: BoxFit.cover,
                  ),
                  shape: OvalBorder(
                    side: const BorderSide(width: 1, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150.w,
                    child: Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: const Color(0xFFFEFEFE),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                        height: 1.5,
                      ),
                    ),
                  ),
                  Text(
                    "Player Dashboard",
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
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  // Handle notification tap
                },
                borderRadius: BorderRadius.circular(30.r),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/Notification.svg",
                    width: 24.w,
                    height: 24.w,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
