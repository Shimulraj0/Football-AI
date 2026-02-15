import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class AuthController extends GetxController {
  // Observables for text fields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController =
      TextEditingController(); // Or reuse emailController if flexible

  // Observables for password visibility
  final RxBool isPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;
  final RxBool rememberMe = false.obs;

  final RxBool isTermsAccepted = false.obs;

  // Selected Role from Dashboard
  final RxString selectedRole = ''.obs;
  String? redirectRoute;

  @override
  void onInit() {
    super.onInit();
    // Get arguments if passed (e.g., from Dashboard)
    if (Get.arguments != null) {
      if (Get.arguments is Map) {
        selectedRole.value = Get.arguments['role'] ?? '';
        redirectRoute = Get.arguments['redirect'];
      } else if (Get.arguments is String) {
        selectedRole.value = Get.arguments;
      }
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void login() {
    // Implement login logic
    debugPrint(
      "Login with ${emailController.text} and role ${selectedRole.value}",
    );

    _handleRedirection();
  }

  void signUp() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields");
      return;
    }

    if (!isTermsAccepted.value) {
      Get.snackbar("Error", "Please accept the terms and conditions");
      return;
    }

    // Implement sign up logic
    debugPrint(
      "Sign up with ${emailController.text} and role ${selectedRole.value}",
    );

    _handleRedirection();
  }

  void _handleRedirection() {
    // 1. If we have a specific redirect route passed from Dashboard, use it.
    if (redirectRoute != null && redirectRoute!.isNotEmpty) {
      Get.offAllNamed(redirectRoute!);
      return;
    }

    // 2. Fallback based on Role if no specific route found (legacy support)
    switch (selectedRole.value) {
      case "Coach":
        Get.offAllNamed(AppRoutes.home);
        break;
      case "Player":
        Get.offAllNamed(AppRoutes.playerHome);
        break;
      case "Technical Director":
        Get.offAllNamed(
          AppRoutes.technicalDirectorHome,
        ); // Ensure this route exists
        break;
      case "Director of Coaching":
        Get.offAllNamed(
          AppRoutes.directorOfCoachingHome,
        ); // Ensure this route exists
        break;
      default:
        // Default fallback
        if (selectedRole.value.isNotEmpty) {
          Get.snackbar("Success", "Logged in as ${selectedRole.value}");
          // Ideally redirect to a generic dashboard or show error
        }
    }
  }

  void sendResetCode() {
    // Logic to send OTP
    Get.toNamed(AppRoutes.otp);
  }

  void verifyOtp() {
    // Logic to verify OTP
    Get.toNamed(AppRoutes.resetPassword);
  }

  void resetPassword() {
    // Logic to reset password
    Get.offAllNamed(AppRoutes.login);
  }
}
