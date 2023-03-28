import 'package:flutter/material.dart';
import 'package:ui_intern/themes/app_style.dart';

import '../../../themes/app_assets.dart';
import '../../../themes/app_colors.dart';

class TextFormEmail extends StatelessWidget {
  TextFormEmail({
    Key? key,
    required this.emailController,
    required this.isCorretEmail,
    this.iconUrl,
  }) : super(key: key);

  final TextEditingController emailController;
  final bool isCorretEmail;

  String? iconUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color:
              isCorretEmail ? AppColors.lightGray : AppColors.backgroundError,
          border: isCorretEmail
              ? null
              : Border.all(color: AppColors.red, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          iconUrl != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 18, right: 10),
                  child: Image.asset(
                    iconUrl!,
                    width: 32,
                    color: isCorretEmail ? AppColors.black : AppColors.red,
                  ),
                )
              : Container(
                  width: 16,
                ),
          Expanded(
            child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "example@gmail.com",
                  hintStyle: TextStyle(color: AppColors.tertiary),
                )),
          )
        ],
      ),
    );
  }
}
