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

    // If we have a stored redirect route, go there
    if (redirectRoute != null) {
      Get.offAllNamed(redirectRoute!);
      return;
    }

    // Otherwise navigate based on role
    if (selectedRole.value == "Coach") {
      Get.offAllNamed(AppRoutes.home);
    } else if (selectedRole.value == "Player") {
      Get.offAllNamed(AppRoutes.playerHome);
    } else {
      // Default to Dashboard or show error/placeholder for other roles
      if (selectedRole.value.isNotEmpty) {
        // Since we are now handling all dashboard items via login,
        // if we fall through here it means no specific redirect was found
        // or it's a role without a specific home page yet.
        Get.snackbar("Success", "Logged in as ${selectedRole.value}");
      }
    }
  }

  void signUp() {
    // Implement sign up logic
    debugPrint(
      "Sign up with ${emailController.text} and role ${selectedRole.value}",
    );

    // If we have a stored redirect route, go there
    if (redirectRoute != null) {
      Get.offAllNamed(redirectRoute!);
      return;
    }

    // Otherwise navigate based on role
    if (selectedRole.value == "Coach") {
      Get.offAllNamed(AppRoutes.home);
    } else if (selectedRole.value == "Player") {
      Get.offAllNamed(AppRoutes.playerHome);
    } else {
      // Default fallback
      if (selectedRole.value.isNotEmpty) {
        Get.snackbar("Success", "Signed up as ${selectedRole.value}");
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
