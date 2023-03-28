import 'package:flutter/material.dart';
import 'package:ui_intern/components/default_button.dart';
import 'package:ui_intern/components/image_logo.dart';
import 'package:ui_intern/pages/Login/login_page.dart';
import 'package:ui_intern/themes/app_colors.dart';

import '../../components/default_textbutton.dart';
import '../../themes/app_assets.dart';
import '../../themes/app_style.dart';
import '../Login/components/email_form.dart';
import '../Login/components/password_form.dart';
import '../Login/components/social_networking.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  bool _passwordVisible = false;
  bool _passwordconfirmVisible = false;


  bool _isCorretEmail = true;

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
                  EmailForm(emailController: emailController, isCorretEmail: _isCorretEmail,),
                  PasswordForm(
                    passwordController: passwordController,
                    passwordVisible: _passwordVisible,
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    }, hintText: 'Nhập mật khẩu',title: "Mật khẩu",
                  ),
                  PasswordForm(
                    passwordController: confirmpasswordController,
                    passwordVisible: _passwordconfirmVisible,
                    onPressed: () {
                      setState(() {
                        _passwordconfirmVisible = !_passwordconfirmVisible;
                      });
                    }, hintText: 'Nhập lại mật khẩu', title: 'Xác thực mật khẩu',
                  ),
                  DefaultButton(onPressed: (){}, title: 'ĐĂNG KÝ'),
                  SocialNetworking(),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    const Text(
                      'Bạn đã có tài khoản?',
                      style: AppStyles.body1,
                    ),
                    TextButtonDefault(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Loginpage() ));
                      },
                      title: 'ĐĂNG NHẬP NGAY',
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
