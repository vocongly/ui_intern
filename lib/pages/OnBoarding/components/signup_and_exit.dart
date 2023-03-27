import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/app_style.dart';

class SignUpAndExit extends StatelessWidget {
  const SignUpAndExit({
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
        TextButton(
          onPressed: signup,
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              primary: AppColors.white,
              backgroundColor: AppColors.blue,
              minimumSize: const Size.fromHeight(48)),
          child: Text('ĐĂNG NHẬP',
              style: AppStyles.button.copyWith(
                color: AppColors.white,
              )),
        ),
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
