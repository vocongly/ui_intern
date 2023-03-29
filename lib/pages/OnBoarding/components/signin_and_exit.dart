import 'package:flutter/material.dart';

import '../../../components/primary_button.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_style.dart';

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
        PrimaryButton(onPressed: signup,title: 'ĐĂNG NHẬP',),
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


