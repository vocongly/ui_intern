import 'package:flutter/material.dart';

import '../themes/app_assets.dart';
import '../themes/app_colors.dart';

class BaseTextForm extends StatelessWidget {
  const BaseTextForm({
    Key? key,
    required this.controller,
    required this.passwordVisible,
    required this.hintText,
    required this.onPressed, 
    this.isCorretValid,
  }) : super(key: key);

  final TextEditingController controller;
  final bool? passwordVisible;
  final String hintText;
  final VoidCallback? onPressed;
  final bool? isCorretValid;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.lightGray),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              obscureText: passwordVisible != null ? !passwordVisible! : false,
              decoration: InputDecoration(
                hintText: hintText,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                hintStyle: const TextStyle(color: AppColors.tertiary),
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.blue, width: 1.0),
                  borderRadius: BorderRadius.circular(16)),
                suffixIcon: passwordVisible != null
                  ? IconButton(
                      icon: ImageIcon(passwordVisible!
                        ? const AssetImage(AppAssets.ic_eye_line)
                        : const AssetImage(
                            AppAssets.ic_eye_close_line)),
                      onPressed: onPressed)
                  : null),
            ),
          )
        ],
      ),
    );
  }
}
