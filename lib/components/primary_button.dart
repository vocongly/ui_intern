import 'package:flutter/material.dart';

import '../themes/app_style.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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
          shape: shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: backgroundColor ,
          minimumSize: const Size.fromHeight(48),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (preIconUrl != null)
              Image.asset(
                preIconUrl!,
                color: textColor ,
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(title,
                  style: AppStyles.button.copyWith(
                    color: textColor ,
                  )),
            ),
            if (afterIconUrl != null)
              Image.asset(
                afterIconUrl!,
                color: textColor ,
              ),
          ],
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.preIconUrl,
      this.afterIconUrl,
      this.backgroundColor,
      this.textColor,
      required this.borderColor});

  final VoidCallback onPressed;
  final String title;
  final String? preIconUrl;
  final String? afterIconUrl;
  final Color? backgroundColor;
  final Color? textColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onPressed: onPressed,
      title: title,
      textColor: textColor,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: borderColor, width: 1)),
    );
  }
}

class BaseTextButton extends StatelessWidget {
  const BaseTextButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.textColor,
      this.preIconUrl,
      this.afterIconUrl});

  final String title;
  final VoidCallback onPressed;
  final Color? textColor;
  final String? preIconUrl;
  final String? afterIconUrl;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onPressed: onPressed,
      title: title,
      textColor: textColor,
      preIconUrl: preIconUrl,
      afterIconUrl: afterIconUrl,
    );
  }
}
