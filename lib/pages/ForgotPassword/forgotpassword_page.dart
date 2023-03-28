import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_intern/components/default_button.dart';
import 'package:ui_intern/components/default_textbutton.dart';
import 'package:ui_intern/components/image_logo.dart';
import 'package:ui_intern/pages/Login/components/social_networking.dart';
import 'package:ui_intern/pages/Login/login_page.dart';
import 'package:ui_intern/themes/app_colors.dart';

import '../../themes/app_style.dart';
import '../ResetPassword/resetpassword_page.dart';
import 'components/digit_code.dart';
import 'components/input_code.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController otpController1 = new TextEditingController();
  TextEditingController otpController2 = new TextEditingController();
  TextEditingController otpController3 = new TextEditingController();
  TextEditingController otpController4 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageLogo(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Quên mật khẩu',
                      style: AppStyles.heading3,
                    ),
                    const Text(
                      'Nhập mã code được gửi đến điện thoại của bạn',
                      style: AppStyles.body1,
                    ),
                    DigitCode(
                        otpController1: otpController1,
                        otpController2: otpController2,
                        otpController3: otpController3,
                        otpController4: otpController4),
                    Center(
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Chưa nhận được mã code? ",
                            style: AppStyles.body1),
                        TextSpan(
                            text: "GỬI LẠI",
                            style: AppStyles.button
                                .copyWith(color: AppColors.blue),
                            recognizer: TapGestureRecognizer()..onTap = () {})
                      ])),
                    ),
                    DefaultButton(onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResetPasswordPage() ));
                    }, title: "XÁC NHẬN"),
                    SocialNetworking(),
                  ],
                ),
                Center(
                    child: TextButtonDefault(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Loginpage()));
                        }, title: "< TRỞ VỀ ĐĂNG NHẬP"))
              ]),
        ),
      ),
    );
  }
}

