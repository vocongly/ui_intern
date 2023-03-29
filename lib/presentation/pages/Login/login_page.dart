import 'package:flutter/material.dart';
import 'package:ui_intern/presentation/components/button_widget.dart';
import 'package:ui_intern/presentation/pages/ForgotPassword/forgotpassword_page.dart';
import 'package:ui_intern/presentation/pages/Signup/signup_page.dart';

import '../../../ulti/style/app_colors.dart';
import '../../../ulti/style/app_style.dart';
import '../../components/base_textform.dart';
import '../../components/image_logo.dart';
import 'components/forgot_password.dart';
import 'components/social_networking.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginpageState();
}

class _LoginpageState extends State<LoginPage> {
  bool _passwordVisible = false;

  bool _isCorretEmail = true;
  bool _isCorretPassword = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(em);
  }

  bool isPassword(String em) {
    if (em.length < 8) {
      return false;
    }
    return true;
  }

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
              const ImageLogo(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Đăng nhập',
                    style: AppStyles.heading3,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  BaseTextForm(
                    controller: emailController,
                    isCorretValid: _isCorretEmail,
                    errorText: 'Error text',
                    title: 'Email',
                    hintText: 'Nhập email của bạn', 
                  ),
                  BaseTextForm(
                    controller: passwordController,
                    title: 'Mật khẩu',
                    isCorretValid: _isCorretPassword,
                    errorText: 'Mật khẩu phải ít nhất 8 kí tự',
                    hintText: 'Mật khẩu chứa 8 kí tự',
                    passwordVisible: _passwordVisible,
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  ForgotPassword(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordPage()));
                    },
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ButtonWidget.primary(
                    onPressed: () {
                      if (!isEmail(emailController.text)) {
                        setState(
                          () {
                            _isCorretEmail = false;
                          },
                        );
                      } else {
                        setState(() {
                          _isCorretEmail = true;
                        });
                      }

                      if (!isPassword(passwordController.text)) {
                        setState(
                          () {
                            _isCorretPassword = false;
                          },
                        );
                      } else {
                        setState(() {
                          _isCorretPassword = true;
                        });
                      }
                    },
                    title: 'ĐĂNG NHẬP',
                  ),
                  const SocialNetworking(),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    const Text(
                      'Bạn chưa có tài khoản?',
                      style: AppStyles.body1,
                    ),
                    ButtonWidget.text(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupPage()));
                      },
                      title: 'ĐĂNG KÝ NGAY',
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
