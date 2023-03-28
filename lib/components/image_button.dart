import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({
    Key? key, required this.imagePath, required this.onClicked,
  }) : super(key: key);

  final String imagePath;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onClicked,child: Image.asset(imagePath,color: AppColors.blue,));
  }
}