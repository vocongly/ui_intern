import 'package:flutter/material.dart';

import 'textform_password.dart';
import '../../../components/title_star.dart';

class PasswordForm extends StatelessWidget {
  PasswordForm({
    Key? key,
    required this.passwordController,
    this.iconUrl,
    required bool passwordVisible, required this.onPressed, required this.title, required this.hintText,
  }) : _passwordVisible = passwordVisible, super(key: key);

  final TextEditingController passwordController;
  final bool _passwordVisible;
  final VoidCallback onPressed;
  final String title;
  final String hintText;

  String? iconUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleStar(title: title),
        TextFormPassword(
          iconUrl: iconUrl,
          passwordController: passwordController,
          passwordVisible: _passwordVisible,
          onPressed: onPressed, hintText: hintText,
        )
      ],
    );
  }
}
