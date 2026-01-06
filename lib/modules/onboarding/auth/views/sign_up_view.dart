import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../widgets/auth_widgets.dart';
import '../../../../core/values/app_colors.dart';

class SignUpView extends GetView<AuthController> {
  const SignUpView({super.key});

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
                    "Sign Up",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Title
              const Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00204A),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "It only takes a minute to create your\naccount.",
                style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
              ),
              const SizedBox(height: 32),

              // Form
              AuthTextField(
                label: "",
                hint: "Full name",
                controller: controller.nameController,
              ),
              const SizedBox(height: 16),
              AuthTextField(
                label: "",
                hint: "E-mail address",
                controller: controller
                    .emailController, // Reusing email controller for simplicity in this example
              ),
              const SizedBox(height: 16),
              Obx(
                () => AuthTextField(
                  label: "",
                  hint: "Password",
                  prefixSvgAssets: "assets/icons/lock.svg",
                  isPassword: true,
                  controller: controller.passwordController,
                  isVisible: controller.isPasswordVisible.value,
                  onVisibilityToggle: controller.togglePasswordVisibility,
                ),
              ),

              const SizedBox(height: 16),
              // Terms checkbox (Placeholder)
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (v) {},
                    activeColor: const Color(0xFF00204A),
                  ),
                  const Text(
                    "Accept terms & conditions",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Sign Up Button
              AuthButton(text: "Sign Up", onPressed: controller.signUp),
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
            ],
          ),
        ),
      ),
    );
  }
}
