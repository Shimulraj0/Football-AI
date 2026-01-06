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

  // Selected Role from Dashboard
  final RxString selectedRole = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Get arguments if passed (e.g., from Dashboard)
    if (Get.arguments != null && Get.arguments is String) {
      selectedRole.value = Get.arguments;
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

    // Navigate based on role
    if (selectedRole.value == "Coach") {
      Get.offAllNamed(AppRoutes.home);
    } else {
      // Default to Dashboard or show error/placeholder for other roles
      // For now, let's go to Dashboard so they can re-select or see 'Coming Soon'
      // Or maybe go to a placeholder "Player Home" if we had one.
      // User request only specified Coach -> Home.
      // Let's assume others might go back to Dashboard or stay.
      // But typically login should go *somewhere*.
      // Let's print for now or route all "Others" to dashboard?
      // Re-reading user request: "this page will route after select the coach tile" -> implies specific logic for coach.
      // "whether i select any tile i have face auth anyhow" -> implies Auth is the gate.

      // Let's assume for now only Coach has a built dashboard.
      if (selectedRole.value.isNotEmpty) {
        // Placeholder for other roles
        Get.snackbar("Success", "Logged in as ${selectedRole.value}");
      }
    }
  }

  void signUp() {
    // Implement sign up logic
    debugPrint(
      "Sign up with ${emailController.text} and role ${selectedRole.value}",
    );
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
