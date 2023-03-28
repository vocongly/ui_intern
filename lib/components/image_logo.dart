import 'package:flutter/material.dart';

import '../themes/app_assets.dart';
import '../themes/app_colors.dart';

class ImageLogo extends StatelessWidget {
  const ImageLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
      AppAssets.ic_logo2,
      color: AppColors.blue,
    ));
  }
}