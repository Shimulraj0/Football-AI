import 'package:get/get.dart';
import 'app_routes.dart';
import '../modules/onboarding/views/splash_view.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/onboarding/auth/views/sign_in_view.dart';
import '../modules/onboarding/auth/views/sign_up_view.dart';
import '../modules/onboarding/auth/views/forgot_password_view.dart';
import '../modules/onboarding/auth/views/otp_view.dart';
import '../modules/onboarding/auth/views/reset_password_view.dart';
import '../modules/onboarding/auth/controllers/auth_controller.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/team_management/views/team_management_view.dart';
import '../modules/home/team_management/bindings/team_management_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/edit_profile_view.dart';
import '../modules/settings/views/change_password_view.dart';
import '../modules/settings/views/faq_view.dart';
import '../modules/settings/views/contact_support_view.dart';
import '../modules/settings/views/privacy_policy_view.dart';
import '../modules/settings/views/terms_condition_view.dart';
import '../modules/settings/controllers/edit_profile_controller.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashView()),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingView(),
      transition: Transition.fadeIn,
    ),
    GetPage(name: AppRoutes.dashboard, page: () => const DashboardView()),
    GetPage(
      name: AppRoutes.login,
      page: () => const SignInView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => AuthController())),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => AuthController())),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => AuthController())),
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () => const OtpView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => AuthController())),
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => const ResetPasswordView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => AuthController())),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.teamManagement,
      page: () => const TeamManagementView(),
      binding: TeamManagementBinding(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.editProfile,
      page: () => const EditProfileView(),
      binding: BindingsBuilder(
        () => Get.lazyPut(() => EditProfileController()),
      ),
    ),
    GetPage(
      name: AppRoutes.changePassword,
      page: () => const ChangePasswordView(),
    ),
    GetPage(name: AppRoutes.faq, page: () => const FaqView()),
    GetPage(
      name: AppRoutes.contactSupport,
      page: () => const ContactSupportView(),
    ),
    GetPage(
      name: AppRoutes.privacyPolicy,
      page: () => const PrivacyPolicyView(),
    ),
    GetPage(
      name: AppRoutes.termsCondition,
      page: () => const TermsConditionView(),
    ),
  ];
}
