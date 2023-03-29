import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/app_style.dart';

class BaseTitle extends StatelessWidget {
  const BaseTitle({
    Key? key, required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppStyles.label.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 8,
        ),
        const Text('*',style: TextStyle(color: AppColors.red),)
      ],
    );
  }
}