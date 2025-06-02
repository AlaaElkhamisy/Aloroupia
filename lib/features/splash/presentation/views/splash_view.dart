import 'package:aloroupia/core/manager/navigation/navigation.dart';
import 'package:aloroupia/core/router/app_router.dart';
import 'package:aloroupia/features/splash/presentation/views/widgets/splash_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void initState() {
    super.initState();
    delayedNavigation(AppRouter.onBoardingView);
    // bool isOnboardingVisited =
    //     getIt<CacheHelper>().getData(key: "isOnboardingVisited") ?? false;
    // if (isOnboardingVisited == true) {
    //   delayedNavigation(AppRouter.logInView);
    // } else {
    //   delayedNavigation(AppRouter.onBoardingView);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashBody());
  }

  Future<dynamic> delayedNavigation(path) {
    return Future.delayed(Duration(seconds: 5), () {
      context.pushNamedAndRemoveUntil(path, predicate: (route) => false);
    });
  }
}
