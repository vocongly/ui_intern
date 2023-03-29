// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ui_intern/presentation/pages/OnBoarding/onboarding_page.dart';

import '../../../ulti/style/app_assets.dart';
import '../../../ulti/style/app_colors.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {

  @override
  void initState() {
    super.initState();
    _navigatetoboarding();
  }

  _navigatetoboarding() async {
    await Future.delayed(const Duration(milliseconds: 1000,));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnBoardingPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Center(
        child: Image.asset(AppAssets.ic_logo2),
      ),
    );
  }
}