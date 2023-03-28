import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui_intern/themes/app_style.dart';

import '../../../themes/app_assets.dart';
import '../../../themes/app_colors.dart';

class TextFormPassword extends StatelessWidget {
  TextFormPassword(
      {super.key,
      required this.onPressed,
      this.iconUrl,
      required this.passwordController,
      required this.passwordVisible, required this.hintText});

  final VoidCallback onPressed;
  final TextEditingController passwordController;
  final bool passwordVisible;
  final String hintText;

  String? iconUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: AppColors.lightGray),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          iconUrl != null 
          ? Padding(
              padding: const EdgeInsets.only(left: 18, right: 10),
              child: Image.asset(
                iconUrl!,
                width: 32,
              ),
            ) : Container(width: 16,),
          Expanded(
            child: TextFormField(
              controller: passwordController,
              obscureText: !passwordVisible,
              decoration: InputDecoration(
                hintText: hintText,hintStyle: TextStyle(color: AppColors.tertiary),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                      icon: ImageIcon(passwordVisible
                          ? AssetImage(AppAssets.ic_eye_line)
                          : AssetImage(AppAssets.ic_eye_close_line)),
                      onPressed: onPressed)),
            ),
          )
        ],
      ),
    );
  }
}
