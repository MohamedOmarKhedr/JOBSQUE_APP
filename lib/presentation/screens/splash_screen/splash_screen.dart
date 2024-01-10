import 'dart:async';
import 'package:flutter_svg/svg.dart';
import 'package:job_finder/core/my_cache_keys.dart';
import 'package:job_finder/core/screens.dart' as screens;
import 'package:flutter/material.dart';
import 'package:job_finder/data/local_data/my_cache.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    bool isOnBoardingViewed =
        MyCache.getBool(key: MyCacheKeys.isOnBoardingViewed);
    bool isRegisterFinished =
        MyCache.getBool(key: MyCacheKeys.isRegisterFinished);
    bool isLoginFinished = MyCache.getBool(key: MyCacheKeys.isLoginFinished);
    if (!isOnBoardingViewed) {
      Timer(
          const Duration(seconds: 1),
          () => Navigator.pushNamedAndRemoveUntil(
              context, screens.onboardingScreen, (route) => false));
    } else if (!isRegisterFinished) {
      Timer(
          const Duration(seconds: 1),
          () => Navigator.pushNamedAndRemoveUntil(
              context, screens.registerScreen, (route) => false));
    } else if (!isLoginFinished) {
      Timer(
          const Duration(seconds: 1),
          () => Navigator.pushNamedAndRemoveUntil(
              context, screens.loginScreen, (route) => false));
    } else {
      Timer(
          const Duration(seconds: 1),
          () => Navigator.pushNamedAndRemoveUntil(
              context, screens.homeLayoutScreen, (route) => false));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Positioned.fill(
          child: SvgPicture.asset(
            'assets/images/Blur.svg',
            fit: BoxFit.cover,
          ),
        ),
        Center(child: SvgPicture.asset("assets/images/Logo.svg"))
      ],
    );
  }
}
