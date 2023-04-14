import 'package:flutter/material.dart';
import 'package:ui_intern/presentation/components/button/button_widget.dart';


class SignInAndExit extends StatelessWidget {
  const SignInAndExit({
    Key? key,
    required this.signup,
    required this.exit,
  }) : super(key: key);

  final VoidCallback signup;
  final VoidCallback exit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonWidget.primary(content: 'ĐĂNG NHẬP', onTap: signup),
        ButtonWidget.text(onTap: exit, content: 'LẦN SAU')
      ],
    );
  }
}
