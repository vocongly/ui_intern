import 'package:flutter/material.dart';
import 'package:ui_intern/presentation/components/button_widget.dart';

import '../../../ulti/style/app_assets.dart';
import '../../../ulti/style/app_colors.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 32,),
              ButtonWidget.primary(
                  onPressed: () {},
                  title: 'BUTTON',
                  preIconUrl: AppAssets.ic_home,
                  afterIconUrl: AppAssets.ic_arow_right),
              const SizedBox(height: 32,),
              ButtonWidget.secondary(
                  onPressed: () {},
                  title: 'BUTTON',
                  preIconUrl: AppAssets.ic_home,
                  afterIconUrl: AppAssets.ic_arow_right),
              const SizedBox(height: 32,),
              ButtonWidget.text(
                  onPressed: () {},
                  title: 'BUTTON',
                  preIconUrl: AppAssets.ic_home,
                  afterIconUrl: AppAssets.ic_arow_right),
            ],
          ),
        ),
      ),
    );
  }
}
