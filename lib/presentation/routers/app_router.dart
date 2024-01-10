import 'package:flutter/material.dart';
import 'package:job_finder/core/screens.dart' as screens;
import 'package:job_finder/presentation/screens/register_screen/register_screen_2.dart';
import 'package:job_finder/presentation/screens/reset_password_screen/reset_password_screen_2.dart';

import '../../data/models/finish_screen_model.dart';
import '../../data/remote_data/responses/filter_jobs_response.dart';
import '../../data/remote_data/responses/get_jobs_response.dart';
import '../screens/applied_screen/applied_job_steps_screen.dart';
import '../screens/apply_job_screen/apply_job_screen.dart';
import '../screens/home_layout_screen/home_layout_screen.dart';
import '../screens/job_details_screen/job_details_screen.dart';
import '../screens/login_screen/login_screen.dart';
import '../screens/messages_screen/chat_screen.dart';
import '../screens/notification_screen/notification_screen.dart';
import '../screens/onboarding_screen/onboarding_screen.dart';
import '../screens/profile_screen/complete_profile_screen/complete_profile_screen.dart';
import '../screens/profile_screen/complete_profile_screen/education_screen/education_screen.dart';
import '../screens/profile_screen/complete_profile_screen/experience_screen/experience_screen.dart';
import '../screens/profile_screen/edit_profile_screen/edit_profile_screen.dart';
import '../screens/profile_screen/help_center_screen/help_center_screen.dart';
import '../screens/profile_screen/language_screen/language_screen.dart';
import '../screens/profile_screen/login_and_security_screen/change_password_screen/change_password_screen.dart';
import '../screens/profile_screen/login_and_security_screen/email_address_screen/email_address_screen.dart';
import '../screens/profile_screen/login_and_security_screen/login_and_security_screen.dart';
import '../screens/profile_screen/login_and_security_screen/phone_number_screen/phone_number_screen.dart';
import '../screens/profile_screen/login_and_security_screen/two_step_verification_screen/two_step_verification_screen.dart';
import '../screens/profile_screen/login_and_security_screen/two_step_verification_screen/two_step_verification_screen2.dart';
import '../screens/profile_screen/login_and_security_screen/two_step_verification_screen/two_step_verification_screen3.dart';
import '../screens/profile_screen/login_and_security_screen/two_step_verification_screen/two_step_verification_screen4.dart';
import '../screens/profile_screen/notification_setting_screen/notification_setting_screen.dart';
import '../screens/profile_screen/portfolio_screen/portfolio_screen.dart';
import '../screens/profile_screen/privacy_policy_screen/privacy_policy_screen.dart';
import '../screens/profile_screen/terms_and_conditions_screen/terms_and_conditions_screen.dart';
import '../screens/reset_password_screen/reset_password_screen.dart';
import '../screens/search_screen/search_screen.dart';
import '../screens/set_filter_result_screen/set_filter_result_screen.dart';
import '../views/finish_screen.dart';
import '../screens/register_screen/register_screen.dart';
import '../screens/register_screen/register_screen_3.dart';
import '../screens/splash_screen/splash_screen.dart';


class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings) {
    startScreen = const SplashScreen();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case screens.homeLayoutScreen:
        return MaterialPageRoute(builder: (_) => const HomeLayoutScreen());
      case screens.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case screens.registerScreen:
        return MaterialPageRoute(builder: (_) =>  const RegisterScreen());
      case screens.registerScreen2:
        return MaterialPageRoute(builder: (_) =>  const RegisterScreen2());
      case screens.registerScreen3:
        return MaterialPageRoute(builder: (_) =>  const RegisterScreen3());
      case screens.finishScreen:
        FinishScreenModel finishScreenModel = settings.arguments as FinishScreenModel;
        return MaterialPageRoute(builder: (_) =>  FinishScreen(finishScreenModel: finishScreenModel,));
      case screens.loginScreen:
        return MaterialPageRoute(builder: (_) =>  const LoginScreen());
      case screens.resetPasswordScreen:
        return MaterialPageRoute(builder: (_) =>  const ResetPasswordScreen());
      case screens.resetPasswordScreen2:
        return MaterialPageRoute(builder: (_) =>  const ResetPasswordScreen2());
      case screens.jobDetailsScreen:
        JobData jobData= settings.arguments as JobData;
        return MaterialPageRoute(builder: (_) =>  JobDetailsScreen(jobData: jobData,));
      case screens.setFilterResultScreen:
        FilterJobsResponse filterJobsResponse= settings.arguments as FilterJobsResponse;
        return MaterialPageRoute(builder: (_) =>  SetFilterResultScreen(filterJobsResponse: filterJobsResponse,));
      case screens.applyJobScreen:
        JobData jobData= settings.arguments as JobData;
        return MaterialPageRoute(builder: (_) =>  ApplyJobScreen(jobData: jobData,));
      case screens.searchScreen:
        return MaterialPageRoute(builder: (_) =>  const SearchScreen());
      case screens.notificationScreen:
        return MaterialPageRoute(builder: (_) =>  const NotificationScreen());
      case screens.chatScreen:
        Map<String,dynamic> compData= settings.arguments as Map<String,dynamic>;
        return MaterialPageRoute(builder: (_) =>  ChatScreen(compData: compData,));
      case screens.appliedJobStepsScreen:
        Map<String,dynamic> appliedJobData = settings.arguments as Map<String,dynamic>;
        return MaterialPageRoute(builder: (_) =>  AppliedJobStepsScreen(appliedJobData: appliedJobData,));
      case screens.editProfileScreen:
        String title = settings.arguments as String;
        return MaterialPageRoute(builder: (_) =>   EditProfileScreen(title: title,));
      case screens.portfolioScreen:
        return MaterialPageRoute(builder: (_) =>   const PortfolioScreen());
      case screens.languageScreen:
        return MaterialPageRoute(builder: (_) =>   const LanguageScreen());
      case screens.notificationSettingScreen:
        return MaterialPageRoute(builder: (_) =>   const NotificationSettingScreen());
      case screens.loginAndSecurityScreen:
        return MaterialPageRoute(builder: (_) =>   LoginAndSecurityScreen());
      case screens.emailAddressScreen:
        return MaterialPageRoute(builder: (_) =>   const EmailAddressScreen());
      case screens.phoneNumberScreen:
        return MaterialPageRoute(builder: (_) =>   const PhoneNumberScreen());
      case screens.changePasswordScreen:
        return MaterialPageRoute(builder: (_) =>   const ChangePasswordScreen());
      case screens.twoStepVerificationScreen:
        return MaterialPageRoute(builder: (_) =>   const TwoStepVerificationScreen());
      case screens.twoStepVerificationScreen2:
        return MaterialPageRoute(builder: (_) =>   const TwoStepVerificationScreen2());
      case screens.twoStepVerificationScreen3:
        return MaterialPageRoute(builder: (_) =>   const TwoStepVerificationScreen3());
      case screens.twoStepVerificationScreen4:
        return MaterialPageRoute(builder: (_) =>   const TwoStepVerificationScreen4());
      case screens.helpCenterScreen:
        return MaterialPageRoute(builder: (_) =>   const HelpCenterScreen());
      case screens.termsAndConditionsScreen:
        return MaterialPageRoute(builder: (_) =>   const TermsAndConditionsScreen());
      case screens.privacyPolicyScreen:
        return MaterialPageRoute(builder: (_) =>   const PrivacyPolicyScreen());
      case screens.completeProfileScreen:
        return MaterialPageRoute(builder: (_) =>   const CompleteProfileScreen());
      case screens.educationScreen:
        return MaterialPageRoute(builder: (_) =>   const EducationScreen());
      case screens.experienceScreen:
        return MaterialPageRoute(builder: (_) =>   const ExperienceScreen());




      default:
        return null;
    }
  }
}
