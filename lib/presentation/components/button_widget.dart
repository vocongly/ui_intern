import 'package:flutter/material.dart';
import '../../ulti/style/app_colors.dart';
import '../../ulti/style/app_style.dart';

class ButtonWidget {
  static Widget primary({
    required onPressed,
    required title,
    preIconUrl,
    afterIconUrl,
  }) {
    return BaseButton(
      onPressed: onPressed,
      title: title,
      preIconUrl: preIconUrl,
      afterIconUrl: afterIconUrl,
      backgroundColor: AppColors.blue,
      textColor: AppColors.white,
    );
  }

  static Widget secondary(
      {required onPressed, required title, preIconUrl, afterIconUrl}) {
    return BaseButton(
      onPressed: onPressed,
      title: title,
      preIconUrl: preIconUrl,
      afterIconUrl: afterIconUrl,
      backgroundColor: AppColors.white,
      textColor: AppColors.blue,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: AppColors.blue, width: 1)),
    );
  }

  static Widget text(
      {required onPressed, required title, preIconUrl, afterIconUrl}) {
    return BaseButton(
      onPressed: onPressed,
      title: title,
      preIconUrl: preIconUrl,
      afterIconUrl: afterIconUrl,
      textColor: AppColors.blue,
    );
  }
}

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.preIconUrl,
    this.afterIconUrl,
    this.backgroundColor,
    this.textColor,
    this.shape,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String title;
  final String? preIconUrl;
  final String? afterIconUrl;
  final Color? backgroundColor;
  final Color? textColor;
  final RoundedRectangleBorder? shape;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: shape ??
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: backgroundColor,
          minimumSize: const Size.fromHeight(48),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (preIconUrl != null)
              Image.asset(
                preIconUrl!,
                color: textColor,
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(title,
                  style: AppStyles.button.copyWith(
                    color: textColor,
                  )),
            ),
            if (afterIconUrl != null)
              Image.asset(
                afterIconUrl!,
                color: textColor,
              ),
          ],
        ),
      ),
    );
  }
}