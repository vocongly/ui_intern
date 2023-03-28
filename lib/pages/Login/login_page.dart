import 'package:flutter/material.dart';
import 'package:ui_intern/components/default_button.dart';
import 'package:ui_intern/components/default_textbutton.dart';
import 'package:ui_intern/pages/ForgotPassword/forgotpassword_page.dart';
import 'package:ui_intern/pages/Signup/signup_page.dart';
import 'package:ui_intern/themes/app_assets.dart';
import 'package:ui_intern/themes/app_colors.dart';
import 'package:ui_intern/themes/app_style.dart';

import '../../components/image_button.dart';
import '../../components/image_logo.dart';
import 'components/email_form.dart';
import 'components/forgot_password.dart';
import 'components/password_form.dart';
import 'components/social_networking.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  bool _passwordVisible = false;

  bool _isCorretEmail = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  bool isEmail(String em) {
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
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
              ImageLogo(),
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
                  EmailForm(iconUrl: AppAssets.ic_email, emailController: emailController, isCorretEmail: _isCorretEmail,),
                  if(!_isCorretEmail)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text('Email không hợp lệ',style: AppStyles.body2.copyWith(color: AppColors.red,),),
                    ),
                  PasswordForm(
                    iconUrl: AppAssets.ic_password,
                    passwordController: passwordController,
                    passwordVisible: _passwordVisible,
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    }, title: 'Mật khẩu', hintText: '********',
                  ),
                  ForgotPassword(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage() ));
                    },
                  ),
                  DefaultButton(
                    onPressed: () {
                      if (!isEmail(emailController.text)) 
                      {
                        setState(() {
                          _isCorretEmail = !_isCorretEmail;
                        },);
                      }else{
                        setState(() {
                          _isCorretEmail = true;
                        });
                      }
                  }, title: 'ĐĂNG NHẬP',),
                  SocialNetworking(),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    const Text(
                      'Bạn chưa có tài khoản?',
                      style: AppStyles.body1,
                    ),
                    TextButtonDefault(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupPage() ));
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


