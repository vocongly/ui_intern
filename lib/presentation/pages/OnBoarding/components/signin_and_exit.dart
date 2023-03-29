import 'package:flutter/material.dart';

import '../../../../ulti/style/app_colors.dart';
import '../../../../ulti/style/app_style.dart';
import '../../../components/button_widget.dart';


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
        ButtonWidget.primary(onPressed: signup,title: 'ĐĂNG NHẬP',),
        TextButton(
            onPressed: exit,
            child: Text('LẦN SAU',
                style: AppStyles.button.copyWith(
                  color: AppColors.blue,
                )))
      ],
    );
  }
}


