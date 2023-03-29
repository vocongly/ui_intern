import 'package:flutter/material.dart';

import '../../ulti/style/app_colors.dart';
import '../../ulti/style/app_style.dart';


class TextButtonDefault extends StatelessWidget {
  const TextButtonDefault({
    Key? key,
    required this.onPressed, required this.title,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(title,
          style: AppStyles.button.copyWith(
              color: AppColors.blue, fontWeight: FontWeight.w500)),
    );
  }
}
