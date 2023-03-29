
import 'package:flutter/material.dart';

import 'base_errortext.dart';
import 'base_textform.dart';
import 'base_title.dart';

class BaseTitleAndTextForm extends StatelessWidget {
  const BaseTitleAndTextForm({
    Key? key,
    required this.controller,
    required this.title,
    required this.hintText,
    this.passwordVisible,
    this.onPressed,
    this.isCorretValid,
    this.errorText,
  }) : super(key: key);

  final TextEditingController controller;
  final String title;
  final String hintText;
  final bool? passwordVisible;
  final VoidCallback? onPressed;
  final bool? isCorretValid;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BaseTitle(
          title: title,
        ),
        BaseTextForm(
            controller: controller,
            passwordVisible: passwordVisible,
            hintText: hintText,
            isCorretValid: isCorretValid,
            onPressed: onPressed),
        if(!isCorretValid!)
          BaseErrorText(errorText: errorText)
      ],
    );
  }
}


