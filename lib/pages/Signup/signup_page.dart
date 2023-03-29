import 'package:flutter/material.dart';
import 'package:ui_intern/components/base_title_and_textform.dart';
import 'package:ui_intern/components/primary_button.dart';
import 'package:ui_intern/components/image_logo.dart';
import 'package:ui_intern/pages/Login/login_page.dart';
import 'package:ui_intern/themes/app_colors.dart';

import '../../components/default_textbutton.dart';
import '../../themes/app_assets.dart';
import '../../themes/app_style.dart';
import '../Login/components/social_networking.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _passwordVisible = false;
  bool _passwordconfirmVisible = false;

  final bool _isCorretEmail = true;
  final bool _isCorretPassword = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

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
                    'Đăng ký',
                    style: AppStyles.heading3,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  BaseTitleAndTextForm(
                    controller: emailController,
                    isCorretValid: _isCorretEmail,
                    errorText: 'Error text',
                    hintText: 'Nhập email của bạn',
                    title: 'Email',
                  ),
                  BaseTitleAndTextForm(
                    controller: passwordController,
                    passwordVisible: _passwordVisible,
                    isCorretValid: _isCorretPassword,
                    errorText: 'Mật khẩu phải ít nhất 8 kí tự',
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    hintText: 'Nhập mật khẩu',
                    title: "Mật khẩu",
                  ),
                  BaseTitleAndTextForm(
                    controller: confirmpasswordController,
                    isCorretValid: _isCorretPassword,
                    errorText: 'Mật khẩu phải ít nhất 8 kí tự',
                    passwordVisible: _passwordconfirmVisible,
                    onPressed: () {
                      setState(() {
                        _passwordconfirmVisible = !_passwordconfirmVisible;
                      });
                    },
                    hintText: 'Nhập lại mật khẩu',
                    title: 'Xác thực mật khẩu',
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  PrimaryButton(
                    onPressed: () {},
                    title: 'ĐĂNG KÝ',
                    backgroundColor: AppColors.blue,
                    textColor: AppColors.white,
                  ),
                  const SocialNetworking(),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    const Text(
                      'Bạn đã có tài khoản?',
                      style: AppStyles.body1,
                    ),
                    BaseTextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      title: 'ĐĂNG NHẬP NGAY',
                      textColor: AppColors.blue,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
