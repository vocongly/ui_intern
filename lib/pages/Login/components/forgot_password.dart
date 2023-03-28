import 'package:flutter/material.dart';

import '../../../components/default_textbutton.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_style.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: TextButtonDefault(onPressed: onPressed, title: 'QUÊN MẬT KHẨU?',));
  }
}

