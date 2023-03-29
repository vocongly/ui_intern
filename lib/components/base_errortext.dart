import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/app_style.dart';

class BaseErrorText extends StatelessWidget {
  const BaseErrorText({
    Key? key,
    required this.errorText,
  }) : super(key: key);

  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          errorText!,
          style: AppStyles.body2.copyWith(color: AppColors.red),
        ),
      ));
  }
}