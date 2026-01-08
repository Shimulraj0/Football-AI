import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/auth_controller.dart';
import '../widgets/auth_widgets.dart';
import '../../../../core/values/app_colors.dart';

class SignInView extends GetView<AuthController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    "Sign In",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Title
              const Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00204A),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Log in to your account",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 32),

              // Form
              AuthTextField(
                label: "Enter your E-mail or Number",
                hint: "E-mail address or phone number",
                prefixSvgAssets: "assets/icons/mail.svg",
                controller: controller.emailController,
              ),
              const SizedBox(height: 20),
              Obx(
                () => AuthTextField(
                  label: "Password",
                  hint: "********",
                  prefixSvgAssets: "assets/icons/lock.svg",
                  isPassword: true,
                  controller: controller.passwordController,
                  isVisible: controller.isPasswordVisible.value,
                  onVisibilityToggle: controller.togglePasswordVisibility,
                ),
              ),

              // Remember Me & Forgot Password
              Row(
                children: [
                  Obx(
                    () => InkWell(
                      onTap: () => controller.rememberMe.toggle(),
                      child: Container(
                        height: 20,
                        width: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: controller.rememberMe.value
                                ? const Color(0xFF00204A)
                                : Colors.grey,
                            width: 2,
                          ),
                        ),
                        child: controller.rememberMe.value
                            ? const Center(
                                child: Icon(
                                  Icons.circle,
                                  size: 10,
                                  color: Color(0xFF00204A),
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                  const Text(
                    "Remember me",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => Get.toNamed(AppRoutes.forgotPassword),
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(color: Colors.redAccent, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Sign In Button
              AuthButton(text: "Sign In", onPressed: controller.login),
              const SizedBox(height: 32),

              // Divider
              const AuthDivider(),
              const SizedBox(height: 24),

              // Social Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(asset: 'assets/icons/google.svg', onTap: () {}),
                  const SizedBox(width: 20),
                  SocialButton(asset: 'assets/icons/apple.svg', onTap: () {}),
                ],
              ),
              const SizedBox(height: 24),

              // Sign Up Link
              Center(
                child: GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.signUp),
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            color: Color(0xFF00204A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
