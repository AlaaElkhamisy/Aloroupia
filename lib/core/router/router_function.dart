import 'package:aloroupia/core/router/app_router.dart';
import 'package:aloroupia/features/auth/presentation/views/forgot_password/views/create_new_password.dart';
import 'package:aloroupia/features/auth/presentation/views/forgot_password/views/forgot_password.dart';
import 'package:aloroupia/features/auth/presentation/views/forgot_password/views/verify_account_view.dart';
import 'package:aloroupia/features/auth/presentation/views/logIn/views/log_in_view.dart';
import 'package:aloroupia/features/auth/presentation/views/signUp/views/sign_up_view.dart';
import 'package:aloroupia/features/home/presentation/views/home_view.dart';
import 'package:aloroupia/features/home/presentation/views/widgets/classic_view.dart';
import 'package:aloroupia/features/home/presentation/views/widgets/modern_view.dart';
import 'package:aloroupia/features/home/presentation/views/widgets/new_classic_view.dart';
import 'package:aloroupia/features/onBoarding/presentation/views/onboaring_view.dart';
import 'package:aloroupia/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRouter.splashView:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case AppRouter.onBoardingView:
      return MaterialPageRoute(builder: (context) => const OnboaringView());
    case AppRouter.logInView:
      return MaterialPageRoute(builder: (context) => const LogInView());
    case AppRouter.signUPView:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case AppRouter.forgotPasswordView:
      return MaterialPageRoute(builder: (context) => const ForgotPassword());
    case AppRouter.verifyView:
      return MaterialPageRoute(builder: (context) => const VerifyAccountView());
    case AppRouter.createNewPasswordView:
      return MaterialPageRoute(builder: (context) => const CreateNewPassword());
    case AppRouter.homeView:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case AppRouter.classicView:
      return MaterialPageRoute(builder: (context) => const ClassicView());
    case AppRouter.newClassicView:
      return MaterialPageRoute(builder: (context) => const NewClassicView());
    case AppRouter.modernView:
      return MaterialPageRoute(builder: (context) => const ModernView());
    default:
      return MaterialPageRoute(builder: (context) => const SplashView());
  }
}
