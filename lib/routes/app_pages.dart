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
import '../modules/billing/views/billing_view.dart';
import '../modules/tryouts/views/tryouts_view.dart';
import '../modules/clinics/views/clinics_view.dart';
import '../modules/evaluation/views/evaluation_view.dart';
import '../modules/surveys/views/surveys_view.dart';
import '../modules/digital_product_hub/views/digital_product_hub_view.dart';
import '../modules/ai_communication/views/ai_communication_view.dart';
import '../modules/permissions/views/permissions_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/billing/bindings/billing_binding.dart';
import '../modules/tryouts/bindings/tryouts_binding.dart';
import '../modules/clinics/bindings/clinics_binding.dart';
import '../modules/evaluation/bindings/evaluation_binding.dart';
import '../modules/surveys/bindings/surveys_binding.dart';
import '../modules/digital_product_hub/bindings/digital_product_hub_binding.dart';
import '../modules/ai_communication/bindings/ai_communication_binding.dart';
import '../modules/permissions/bindings/permissions_binding.dart';
import '../modules/training_strategy/bindings/training_strategy_binding.dart';
import '../modules/training_strategy/views/training_strategy_view.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashView()),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
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
    GetPage(
      name: AppRoutes.billing,
      page: () => const BillingView(),
      binding: BillingBinding(),
    ),
    GetPage(
      name: AppRoutes.tryouts,
      page: () => const TryoutsView(),
      binding: TryoutsBinding(),
    ),
    GetPage(
      name: AppRoutes.clinics,
      page: () => const ClinicsView(),
      binding: ClinicsBinding(),
    ),
    GetPage(
      name: AppRoutes.evaluation,
      page: () => const EvaluationView(),
      binding: EvaluationBinding(),
    ),
    GetPage(
      name: AppRoutes.surveys,
      page: () => const SurveysView(),
      binding: SurveysBinding(),
    ),
    GetPage(
      name: AppRoutes.digitalProductHub,
      page: () => const DigitalProductHubView(),
      binding: DigitalProductHubBinding(),
    ),
    GetPage(
      name: AppRoutes.aiCommunication,
      page: () => const AiCommunicationView(),
      binding: AiCommunicationBinding(),
    ),
    GetPage(
      name: AppRoutes.permissions,
      page: () => const PermissionsView(),
      binding: PermissionsBinding(),
    ),
    GetPage(
      name: AppRoutes.trainingStrategy,
      page: () => const TrainingStrategyView(),
      binding: TrainingStrategyBinding(),
    ),
  ];
}
