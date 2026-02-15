import 'package:get/get.dart';
import '../modules/dashboard/views/operations_admin_selection_view.dart';
import '../modules/dashboard/views/team_tiers_view.dart';
import '../modules/field_scheduling_director_home/new_schedule/views/select_age_group_view.dart';
import '../modules/field_scheduling_director_home/new_schedule/views/select_available_fields_view.dart';
import '../modules/field_scheduling_director_home/new_schedule/bindings/select_available_fields_binding.dart';
import 'app_routes.dart';
import '../modules/onboarding/views/splash_view.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/dashboard/views/player_family_hub_view.dart';
import '../modules/dashboard/views/staff_workspace_view.dart';
import '../modules/dashboard/views/club_command_center_view.dart';
import '../modules/dashboard/views/operations_admin_view.dart';
import '../modules/dashboard/views/club_setup_governance_view.dart';
import '../modules/dashboard/views/club_info_view.dart';
import '../modules/dashboard/views/club_hierarchy_view.dart';
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
import '../modules/player_home/views/player_home_view.dart';
import '../modules/player_home/views/daily_mindset_view.dart';
import '../modules/player_home/views/training_feedback_view.dart';
import '../modules/player_home/bindings/player_home_binding.dart';
import '../modules/player_home/bindings/training_feedback_binding.dart';
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
import '../modules/billing/views/smart_analytics_view.dart';
import '../modules/billing/views/pro_curriculum_view.dart';
import '../modules/billing/views/parent_player_portal_view.dart';
import '../modules/billing/views/injury_risk_view.dart';
import '../modules/tryouts/views/tryouts_view.dart';
import '../modules/tryouts/views/tryout_setup_view.dart';
import '../modules/tryouts/views/tryout_eval_entry_view.dart';
import '../modules/tryouts/views/tryout_scoring_view.dart';
import '../modules/tryouts/views/tryout_placement_view.dart';
import '../modules/tryouts/views/placement_list_view.dart';
import '../modules/tryouts/views/tryout_invites_view.dart';
import '../modules/clinics/views/clinics_view.dart';
import '../modules/clinics/views/create_clinic_view.dart';
import '../modules/clinics/views/assign_staff_view.dart';
import '../modules/clinics/views/curriculum_builder_view.dart';
import '../modules/clinics/views/manage_registration_view.dart';
import '../modules/clinics/views/attendance_tracker_view.dart';
import '../modules/evaluation/views/evaluation_view.dart';
import '../modules/evaluation/views/evaluated_players_view.dart';
import '../modules/evaluation/views/evaluation_summary_view.dart';
import '../modules/evaluation/views/completed_evaluation_view.dart';
import '../modules/evaluation/views/evaluation_entry_view.dart';
import '../modules/evaluation/views/view_summaries_view.dart';
import '../modules/surveys/views/surveys_view.dart';
import '../modules/surveys/views/survey_details_view.dart';
import '../modules/surveys/views/survey_results_view.dart';
import '../modules/digital_product_hub/views/digital_product_hub_view.dart';
import '../modules/digital_product_hub/views/add_digital_product_view.dart';
import '../modules/digital_product_hub/views/manual_builder_view.dart';
import '../modules/digital_product_hub/views/module_cover_view.dart';
import '../modules/digital_product_hub/views/module_tools_view.dart';
import '../modules/digital_product_hub/views/ai_assistant_view.dart';
import '../modules/digital_product_hub/bindings/add_digital_product_binding.dart';
import '../modules/digital_product_hub/bindings/manual_builder_binding.dart';
import '../modules/digital_product_hub/bindings/module_cover_binding.dart';
import '../modules/digital_product_hub/bindings/module_tools_binding.dart';
import '../modules/digital_product_hub/bindings/ai_assistant_binding.dart';
import '../modules/digital_product_hub/views/progress_tracking_view.dart';
import '../modules/digital_product_hub/bindings/progress_tracking_binding.dart';
import '../modules/digital_product_hub/views/module_settings_view.dart';
import '../modules/digital_product_hub/bindings/module_settings_binding.dart';
import '../modules/digital_product_hub/views/ai_rules_view.dart';
import '../modules/digital_product_hub/bindings/ai_rules_binding.dart';
import '../modules/ai_communication/views/ai_communication_view.dart';
import '../modules/permissions/views/permissions_view.dart';
import '../modules/permissions/views/role_assignment_view.dart';
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
import '../modules/performance_reports/bindings/performance_reports_binding.dart';
import '../modules/performance_reports/views/performance_reports_view.dart';
import '../modules/player_home/views/skill_progress_tracker_view.dart';
import '../modules/player_home/bindings/skill_progress_tracker_binding.dart';
import '../modules/technical_director_home/views/technical_director_home_view.dart';
import '../modules/technical_director_home/bindings/technical_director_home_binding.dart';
import '../modules/curriculum_engine/views/curriculum_engine_view.dart';
import '../modules/curriculum_engine/views/upload_curriculum_view.dart';
import '../modules/curriculum_engine/views/create_curriculum_view.dart';
import '../modules/curriculum_engine/bindings/curriculum_engine_binding.dart';
import '../modules/analytics_insights/views/analytics_insights_view.dart';
import '../modules/analytics_insights/views/club_analytics_dashboard_view.dart';
import '../modules/analytics_insights/views/ai_insights_summary_view.dart';
import '../modules/analytics_insights/bindings/analytics_insights_binding.dart';
import '../modules/curriculum_adaptation/views/curriculum_adaptation_view.dart';
import '../modules/curriculum_adaptation/bindings/curriculum_adaptation_binding.dart';
import '../modules/communication_hub/views/communication_hub_view.dart';
import '../modules/communication_hub/views/communication_summary_view.dart';
import '../modules/communication_hub/views/ai_communication_view.dart'
    as comm_hub_ai;
import '../modules/communication_hub/bindings/communication_hub_binding.dart';
import '../modules/director_of_coaching_home/views/director_of_coaching_home_view.dart';
import '../modules/director_of_coaching_home/bindings/director_of_coaching_home_binding.dart';
import '../modules/assigned_age_groups/views/assigned_age_groups_view.dart';
import '../modules/assigned_age_groups/bindings/assigned_age_groups_binding.dart';
import '../modules/director_of_coaching_home/views/coaches_oversight_view.dart';
import '../modules/director_of_coaching_home/views/evaluation_details_view.dart';
import '../modules/director_of_coaching_home/views/curriculum_alignment_view.dart';
import '../modules/specialty_director_home/views/specialty_director_home_view.dart';
import '../modules/specialty_director_home/bindings/specialty_director_home_binding.dart';
import '../modules/specialty_director_home/gk_director_home/views/gk_director_home_view.dart';
import '../modules/specialty_director_home/gk_director_home/bindings/gk_director_home_binding.dart';
import '../modules/specialty_director_home/ac_director_home/views/ac_director_home_view.dart';
import '../modules/specialty_director_home/ac_director_home/bindings/ac_director_home_binding.dart';
import '../modules/specialty_director_home/sc_director_home/views/sc_director_home_view.dart';
import '../modules/specialty_director_home/sc_director_home/bindings/sc_director_home_binding.dart';
import '../modules/field_scheduling_director_home/views/field_scheduling_director_home_view.dart';
import '../modules/field_scheduling_director_home/bindings/field_scheduling_director_home_binding.dart';
import '../modules/field_scheduling_director_home/new_schedule/views/new_schedule_view.dart';
import '../modules/field_scheduling_director_home/new_schedule/bindings/new_schedule_binding.dart';
import '../modules/field_scheduling_director_home/new_schedule/views/select_date_range_view.dart';
import '../modules/coach_home/views/coach_home_view.dart';
import '../modules/coach_home/bindings/coach_home_binding.dart';

import '../modules/age_group_coordinator_home/views/age_group_coordinator_home_view.dart';
import '../modules/age_group_coordinator_home/bindings/age_group_coordinator_home_binding.dart';
import '../modules/session_observations/views/session_observations_view.dart';
import '../modules/session_observations/bindings/add_observation_notes_binding.dart';
import '../modules/session_observations/views/add_observation_notes_view.dart';
import '../modules/settings/bindings/change_password_binding.dart';
import '../modules/session_observations/bindings/session_observations_binding.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashView()),
    GetPage(name: AppRoutes.onboarding, page: () => const OnboardingView()),
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
      name: AppRoutes.playerHome,
      page: () => const PlayerHomeView(),
      binding: PlayerHomeBinding(),
    ),
    GetPage(name: AppRoutes.dailyMindset, page: () => const DailyMindsetView()),
    GetPage(
      name: AppRoutes.trainingFeedback,
      page: () => const TrainingFeedbackView(),
      binding: TrainingFeedbackBinding(),
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
      binding: ChangePasswordBinding(),
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
      name: AppRoutes.smartAnalytics,
      page: () => const SmartAnalyticsView(),
      binding: BillingBinding(),
    ),
    GetPage(
      name: AppRoutes.proCurriculumEngine,
      page: () => const ProCurriculumView(),
      binding: BillingBinding(),
    ),
    GetPage(
      name: AppRoutes.parentPlayerPortal,
      page: () => const ParentPlayerPortalView(),
      binding: BillingBinding(),
    ),
    GetPage(
      name: AppRoutes.injuryRisk,
      page: () => const InjuryRiskView(),
      binding: BillingBinding(),
    ),
    GetPage(
      name: AppRoutes.tryouts,
      page: () => const TryoutsView(),
      binding: TryoutsBinding(),
    ),
    GetPage(
      name: AppRoutes.tryoutSetup,
      page: () => const TryoutSetupView(),
      binding: TryoutsBinding(),
    ),
    GetPage(
      name: AppRoutes.tryoutEvalEntry,
      page: () => const TryoutEvalEntryView(),
      binding: TryoutsBinding(),
    ),
    GetPage(
      name: AppRoutes.tryoutScoring,
      page: () => const TryoutScoringView(),
      binding: TryoutsBinding(),
    ),
    GetPage(
      name: AppRoutes.tryoutPlacement,
      page: () => const TryoutPlacementView(),
      binding: TryoutsBinding(),
    ),
    GetPage(
      name: AppRoutes.placementList,
      page: () => const PlacementListView(),
      binding: TryoutsBinding(),
    ),
    GetPage(
      name: AppRoutes.tryoutInvites,
      page: () => const TryoutInvitesView(),
      binding: TryoutsBinding(),
    ),
    GetPage(
      name: AppRoutes.clinics,
      page: () => const ClinicsView(),
      binding: ClinicsBinding(),
    ),
    GetPage(
      name: AppRoutes.createClinic,
      page: () => const CreateClinicView(),
      binding: ClinicsBinding(),
    ),
    GetPage(
      name: AppRoutes.assignStaff,
      page: () => const AssignStaffView(),
      binding: ClinicsBinding(),
    ),
    GetPage(
      name: AppRoutes.curriculumBuilder,
      page: () => const CurriculumBuilderView(),
      binding: ClinicsBinding(),
    ),
    GetPage(
      name: AppRoutes.manageRegistration,
      page: () => const ManageRegistrationView(),
      binding: ClinicsBinding(),
    ),
    GetPage(
      name: AppRoutes.attendanceTracker,
      page: () => const AttendanceTrackerView(),
      binding: ClinicsBinding(),
    ),
    GetPage(
      name: AppRoutes.evaluation,
      page: () => const EvaluationView(),
      binding: EvaluationBinding(),
    ),
    GetPage(
      name: AppRoutes.evaluatedPlayers,
      page: () => const EvaluatedPlayersView(),
      binding: EvaluationBinding(), // reusing existing binding for now
    ),
    GetPage(
      name: AppRoutes.evaluationSummary,
      page: () => const EvaluationSummaryView(),
      binding: EvaluationBinding(),
    ),
    GetPage(
      name: AppRoutes.completedEvaluation,
      page: () => const CompletedEvaluationView(),
      binding: EvaluationBinding(),
    ),
    GetPage(
      name: AppRoutes.viewSummaries,
      page: () => const ViewSummariesView(),
      binding: EvaluationBinding(),
    ),
    GetPage(
      name: AppRoutes.evaluationEntry,
      page: () => const EvaluationEntryView(),
      binding: EvaluationBinding(),
    ),
    GetPage(
      name: AppRoutes.surveys,
      page: () => const SurveysView(),
      binding: SurveysBinding(),
    ),
    GetPage(
      name: AppRoutes.surveyDetails,
      page: () => const SurveyDetailsView(),
      binding: SurveysBinding(),
    ),
    GetPage(
      name: AppRoutes.surveyResults,
      page: () => const SurveyResultsView(),
      binding: SurveysBinding(),
    ),
    GetPage(
      name: AppRoutes.digitalProductHub,
      page: () => const DigitalProductHubView(),
      binding: DigitalProductHubBinding(),
    ),
    GetPage(
      name: AppRoutes.addDigitalProduct,
      page: () => const AddDigitalProductView(),
      binding: AddDigitalProductBinding(),
    ),
    GetPage(
      name: AppRoutes.manualBuilder,
      page: () => const ManualBuilderView(),
      binding: ManualBuilderBinding(),
    ),
    GetPage(
      name: AppRoutes.moduleCover,
      page: () => const ModuleCoverView(),
      binding: ModuleCoverBinding(),
    ),
    GetPage(
      name: AppRoutes.moduleTools,
      page: () => const ModuleToolsView(),
      binding: ModuleToolsBinding(),
    ),
    GetPage(
      name: AppRoutes.aiAssistant,
      page: () => const AiAssistantView(),
      binding: AiAssistantBinding(),
    ),
    GetPage(
      name: AppRoutes.progressTracking,
      page: () => const ProgressTrackingView(),
      binding: ProgressTrackingBinding(),
    ),
    GetPage(
      name: AppRoutes.moduleSettings,
      page: () => const ModuleSettingsView(),
      binding: ModuleSettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.aiRules,
      page: () => const AiRulesView(),
      binding: AiRulesBinding(),
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
      name: AppRoutes.roleAssignment,
      page: () => const RoleAssignmentView(),
    ),
    GetPage(
      name: AppRoutes.trainingStrategy,
      page: () => const TrainingStrategyView(),
      binding: TrainingStrategyBinding(),
    ),
    GetPage(
      name: AppRoutes.performanceReports,
      page: () => const PerformanceReportsView(),
      binding: PerformanceReportsBinding(),
    ),
    GetPage(
      name: AppRoutes.skillProgressTracker,
      page: () => const SkillProgressTrackerView(),
      binding: SkillProgressTrackerBinding(),
    ),
    GetPage(
      name: AppRoutes.technicalDirectorHome,
      page: () => const TechnicalDirectorHomeView(),
      binding: TechnicalDirectorHomeBinding(),
    ),
    GetPage(
      name: AppRoutes.curriculumEngine,
      page: () => const CurriculumEngineView(),
      binding: CurriculumEngineBinding(),
    ),
    GetPage(
      name: AppRoutes.uploadCurriculum,
      page: () => const UploadCurriculumView(),
      binding: CurriculumEngineBinding(),
    ),
    GetPage(
      name: AppRoutes.createCurriculum,
      page: () => const CreateCurriculumView(),
      binding: CurriculumEngineBinding(),
    ),
    GetPage(
      name: AppRoutes.analyticsInsights,
      page: () => const AnalyticsInsightsView(),
      binding: AnalyticsInsightsBinding(),
    ),
    GetPage(
      name: AppRoutes.clubAnalyticsDashboard,
      page: () => const ClubAnalyticsDashboardView(),
      binding: AnalyticsInsightsBinding(),
    ),
    GetPage(
      name: AppRoutes.aiInsightsSummary,
      page: () => const AiInsightsSummaryView(),
      binding: AnalyticsInsightsBinding(),
    ),
    GetPage(
      name: AppRoutes.curriculumAdaptation,
      page: () => const CurriculumAdaptationView(),
      binding: CurriculumAdaptationBinding(),
    ),
    GetPage(
      name: AppRoutes.communicationHub,
      page: () => const CommunicationHubView(),
      binding: CommunicationHubBinding(),
    ),
    GetPage(
      name: AppRoutes.communicationSummary,
      page: () => const CommunicationSummaryView(),
      binding: CommunicationHubBinding(),
    ),
    GetPage(
      name: AppRoutes.aiCommunicationHub,
      page: () => const comm_hub_ai.AiCommunicationView(),
      binding: CommunicationHubBinding(),
    ),
    GetPage(
      name: AppRoutes.directorOfCoachingHome,
      page: () => const DirectorOfCoachingHomeView(),
      binding: DirectorOfCoachingHomeBinding(),
    ),
    GetPage(
      name: AppRoutes.assignedAgeGroups,
      page: () => const AssignedAgeGroupsView(),
      binding: AssignedAgeGroupsBinding(),
    ),
    GetPage(
      name: AppRoutes.playerFamilyHub,
      page: () => const PlayerFamilyHubView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.staffWorkspace,
      page: () => const StaffWorkspaceView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.clubCommandCenter,
      page: () => const ClubCommandCenterView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.clubSetupGovernance,
      page: () => const ClubSetupGovernanceView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.clubHierarchy,
      page: () => const ClubHierarchyView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.teamTiers,
      page: () => const TeamTiersView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.clubInfo,
      page: () => const ClubInfoView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.operationsAdmin,
      page: () => const OperationsAdminView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.operationsAdminSelection,
      page: () => const OperationsAdminSelectionView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.specialtyDirectorHome,
      page: () => const SpecialtyDirectorHomeView(),
      binding: SpecialtyDirectorHomeBinding(),
    ),
    GetPage(
      name: AppRoutes.gkDirectorHome,
      page: () => const GkDirectorHomeView(),
      binding: GkDirectorHomeBinding(),
    ),

    GetPage(
      name: AppRoutes.ageGroupCoordinatorHome,
      page: () => const AgeGroupCoordinatorHomeView(),
      binding: AgeGroupCoordinatorHomeBinding(),
    ),
    GetPage(
      name: AppRoutes.sessionObservations,
      page: () => const SessionObservationsView(),
      binding: SessionObservationsBinding(),
    ),
    GetPage(
      name: AppRoutes.addObservationNotes,
      page: () => AddObservationNotesView(),
      binding: AddObservationNotesBinding(),
    ),
    // Placeholder routes for new directors
    GetPage(
      name: AppRoutes.fieldSchedulingDirector,
      page: () => const FieldSchedulingDirectorHomeView(),
      binding: FieldSchedulingDirectorHomeBinding(),
    ),
    GetPage(
      name: AppRoutes.acDirectorHome,
      page: () => const AcDirectorHomeView(),
      binding: AcDirectorHomeBinding(),
    ),
    GetPage(
      name: AppRoutes.scDirectorHome,
      page: () => const ScDirectorHomeView(),
      binding: ScDirectorHomeBinding(),
    ),
    GetPage(
      name: AppRoutes.coachesOversight,
      page: () => const CoachesOversightView(),
    ),
    GetPage(
      name: AppRoutes.evaluationDetails,
      page: () => const EvaluationDetailsView(),
    ),
    GetPage(
      name: AppRoutes.curriculumAlignment,
      page: () => const CurriculumAlignmentView(),
    ),
    GetPage(
      name: AppRoutes.coachHome,
      page: () => const CoachHomeView(),
      binding: CoachHomeBinding(),
    ),
    GetPage(
      name: AppRoutes.newSchedule,
      page: () => const NewScheduleView(),
      binding: NewScheduleBinding(),
    ),
    GetPage(
      name: AppRoutes.selectDateRange,
      page: () => const SelectDateRangeView(),
    ),
    GetPage(
      name: AppRoutes.selectAgeGroup,
      page: () => const SelectAgeGroupView(),
    ),
    GetPage(
      name: AppRoutes.selectAvailableFields,
      page: () => const SelectAvailableFieldsView(),
      binding: SelectAvailableFieldsBinding(),
    ),
  ];
}
