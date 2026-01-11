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

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _topRightAnimation;
  late Animation<Offset> _bottomLeftAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _topRightAnimation = Tween<Offset>(
      begin: const Offset(1.0, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _bottomLeftAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.onboarding);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
            child: FadeTransition(
              opacity: _controller,
              child: SlideTransition(
                position: _topRightAnimation,
                child: Image.asset(
                  'assets/images/shape_top_right.png',
                  width: 200,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          // Bottom Left Shape
          Positioned(
            bottom: 0,
            left: 0,
            child: FadeTransition(
              opacity: _controller,
              child: SlideTransition(
                position: _bottomLeftAnimation,
                child: Image.asset(
                  'assets/images/shape_bottom_left.png',
                  width: 200,
                  fit: BoxFit.contain,
                ),
              ),
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
