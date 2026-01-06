import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../widgets/auth_widgets.dart';
import '../../../../core/values/app_colors.dart';

class ResetPasswordView extends GetView<AuthController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              // Header
              // Header
              Stack(
                alignment: Alignment.center,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: AuthBackButton(),
                  ),
                  const Text(
                    "Reset Password",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 48),

              // Image Placeholder (Phone with user)
              // Ideally SvgPicture.asset or Image.asset
              Container(
                width: 120,
                height: 120,
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  "assets/icons/authentication_outline.svg",
                ),
              ),
              const SizedBox(height: 48),

              // Form
              Obx(
                () => AuthTextField(
                  label: "",
                  hint: "Set New Password",
                  prefixSvgAssets: "assets/icons/lock.svg",
                  isPassword: true,
                  controller: controller
                      .passwordController, // Ideally reset these controllers or use distinct ones
                  isVisible: controller.isPasswordVisible.value,
                  onVisibilityToggle: controller.togglePasswordVisibility,
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => AuthTextField(
                  label: "",
                  hint: "Confirm password",
                  prefixSvgAssets: "assets/icons/lock.svg",
                  isPassword: true,
                  controller:
                      TextEditingController(), // Placeholder for confirm pass controller if not in AuthController yet
                  isVisible: controller.isConfirmPasswordVisible.value,
                  onVisibilityToggle:
                      controller.toggleConfirmPasswordVisibility,
                ),
              ),
              const SizedBox(height: 32),

              // Reset Button
              AuthButton(
                text: "Reset Password",
                onPressed: controller.resetPassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
