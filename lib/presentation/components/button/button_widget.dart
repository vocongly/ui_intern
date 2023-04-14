import 'package:_button/_button.dart';
import 'package:flutter/material.dart';
import 'package:ui_intern/ulti/style/app_colors.dart';
import 'package:ui_intern/ulti/style/app_style.dart';

class ButtonWidget {
  static Widget primary({
    required VoidCallback onTap,
    required String content,
    String? prefixIconPath,
    bool isDirection = false,
    bool isDisable = false,
    bool isExpand = true,
    double borderRadius = 8,
  }) {
    return ButtonBrick().primary(
        backgroundColor: AppColors.blue,
        preIconUrl: prefixIconPath,
        isDirection: isDirection,
        content: content,
        borderRadius: borderRadius,
        contentColor: Colors.white,
        disableBackgroundColor: Colors.grey,
        disableContentColor: Colors.black,
        onPressed: onTap,
        textStyle: AppStyles.button.copyWith(color: Colors.white),
        isExpandedContent: isExpand);
  }

  static Widget primaryWhite({
    required VoidCallback onTap,
    required String content,
    String? prefixIconPath,
    bool isDirection = false,
    bool isDisable = false,
    bool isExpand = true,
  }) {
    return ButtonBrick().primary(
        onPressed: onTap,
        content: content,
        textStyle: AppStyles.button.copyWith(color: AppColors.blue),
        contentColor: AppColors.blue,
        backgroundColor: Colors.white,
        disableContentColor: AppColors.gray,
        disableBackgroundColor: AppColors.black,
        isExpandedContent: isExpand,
        isDirection: isDirection,
        disable: isDisable,
        borderRadius: isExpand ? 12 : 10,
        preIconUrl: prefixIconPath);
  }

  static Widget secondary({
    required VoidCallback onTap,
    required String content,
    String? prefixIconPath,
    bool isDirection = false,
    bool isDisable = false,
    bool isExpand = true,
  }) {
    return ButtonBrick().secondary(
      onPressed: onTap,
      content: content,
      textStyle: AppStyles.button.copyWith(color: Colors.grey[900]),
      contentColor: Colors.grey[900]!,
      disableContentColor: Colors.grey[300]!,
      preIconUrl: prefixIconPath,
      isDirection: isDirection,
      isExpandedContent: isExpand,
      disable: isDisable,
      borderRadius: isExpand ? 12 : 10,
    );
  }

  static text(
      {required VoidCallback onTap,
      required String content,
      String? preIconUrl,
      TextStyle? textStyle}) {
    return ButtonBrick().text(
        onPressed: onTap,
        preIconUrl: preIconUrl,
        content: content,
        textStyle:
            textStyle ?? AppStyles.button.copyWith(color: AppColors.blue),
        contentColor: AppColors.blue,
        disableContentColor: AppColors.gray);
  }
}
