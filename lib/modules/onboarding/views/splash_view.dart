import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../routes/app_routes.dart';
import '../../../core/values/app_colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Top Right Shape
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/images/shape_top_right.png',
              width: 200,
              fit: BoxFit.contain,
            ),
          ),
          // Bottom Left Shape
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/images/shape_bottom_left.png',
              width: 200,
              fit: BoxFit.contain,
            ),
          ),
          // Center Logo
          Center(
            child: SvgPicture.asset('assets/images/Layer_1.svg', width: 200),
          ),
        ],
      ),
    );
  }
}
