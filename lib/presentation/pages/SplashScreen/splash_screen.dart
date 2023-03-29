// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ui_intern/presentation/pages/SplashScreen/splash_screen2.dart';

import '../../../ulti/style/app_assets.dart';
import '../../../ulti/style/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetosplash2();
  }

  _navigatetosplash2() async {
    await Future.delayed(const Duration(milliseconds: 1000,));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SplashScreen2()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Center(
        child: Image.asset(AppAssets.ic_logo1),
      ),
    );
  }
}
