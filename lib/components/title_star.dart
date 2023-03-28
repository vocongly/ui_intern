import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/app_style.dart';

class TitleStar extends StatelessWidget {
  const TitleStar({
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
        SizedBox(
          width: 8,
        ),
        Text('*',style: TextStyle(color: AppColors.red),)
      ],
    );
  }
}