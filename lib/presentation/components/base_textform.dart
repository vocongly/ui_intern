import 'package:flutter/material.dart';

import '../../ulti/style/app_assets.dart';
import '../../ulti/style/app_colors.dart';
import '../../ulti/style/app_style.dart';


class BaseTextForm extends StatelessWidget {
  const BaseTextForm({
    Key? key,
    required this.controller,
    this.passwordVisible,
    required this.hintText,
    this.onPressed,
    this.isCorretValid,
    this.title,
    this.errorText,
  }) : super(key: key);

  final TextEditingController controller;
  final bool? passwordVisible;
  final String? title;
  final String? errorText;
  final String hintText;
  final VoidCallback? onPressed;
  final bool? isCorretValid;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (title != null)
          Row(
            children: [
              Text(title!,style: AppStyles.label.copyWith(fontWeight: FontWeight.bold),),
              const SizedBox(width: 8,),
              const Text('*',style: TextStyle(color: AppColors.red),)
            ],
          ),
        Container(
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
                  obscureText:
                      passwordVisible != null ? !passwordVisible! : false,
                  decoration: InputDecoration(
                      hintText: hintText,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      hintStyle: const TextStyle(color: AppColors.tertiary),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.blue, width: 1.0),
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
        ),
        if (!isCorretValid!) 
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                errorText!,
                style: AppStyles.body2.copyWith(color: AppColors.red),
              ),
            ),
          )
      ],
    );
  }
}
