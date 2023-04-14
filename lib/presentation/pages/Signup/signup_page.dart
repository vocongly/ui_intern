import 'package:flutter/material.dart';
import 'package:ui_intern/presentation/pages/Login/login_page.dart';

import '../../../ulti/style/app_assets.dart';
import '../../../ulti/style/app_colors.dart';
import '../../../ulti/style/app_style.dart';
import '../../components/button/button_widget.dart';
import '../../components/image/image_logo.dart';
import '../../components/textfield/textfield_widget.dart';
import '../Login/components/social_networking.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _passwordVisible = false;
  bool _passwordconfirmVisible = false;


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
              const ImageLogo(),
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
                  TextfieldWidget.common(
                      onChanged: (value) {},
                      textEditingController: emailController,
                      title: 'Email',
                      required: true,
                      prefixIconPath: AppAssets.ic_email,
                      hintText: "Nhập email của bạn",
                      textStyle: AppStyles.body1,
                      hintStyle: AppStyles.body1.copyWith(color: AppColors.tertiary),
                      titleStyle: AppStyles.label,
                      disableTextColor: Colors.black,
                      disableBackgroundColor: Colors.grey),
                  TextfieldWidget.common(
                    textEditingController: passwordController,
                    isObscured: _passwordVisible,
                    suffixIconPath: AppAssets.ic_eye_close_line,
                    prefixIconPath: AppAssets.ic_password,
                    iconColor: AppColors.tertiary,
                    onSuffixIconTap: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    hintText: 'Nhập mật khẩu mới',
                    title: "Mật khẩu mới",
                    required: true,
                    disableBackgroundColor: AppColors.gray,
                    disableTextColor: AppColors.black,
                    hintStyle: AppStyles.body1.copyWith(color: AppColors.tertiary),
                    onChanged: (value) {},
                    textStyle: AppStyles.body1,
                    titleStyle: AppStyles.label,
                  ),
                  TextfieldWidget.common(
                    textEditingController: confirmpasswordController,
                    isObscured: _passwordconfirmVisible,
                    suffixIconPath: AppAssets.ic_eye_close_line,
                    prefixIconPath: AppAssets.ic_password,
                    iconColor: AppColors.tertiary,
                    onSuffixIconTap: () {
                      setState(() {
                        _passwordconfirmVisible = !_passwordconfirmVisible;
                      });
                    },
                    hintText: 'Nhập lại mật khẩu mới',
                    title: "Mật khẩu mới",
                    required: true,
                    disableBackgroundColor: AppColors.gray,
                    disableTextColor: AppColors.black,
                    hintStyle: AppStyles.body1.copyWith(color: AppColors.tertiary),
                    onChanged: (value) {},
                    textStyle: AppStyles.body1,
                    titleStyle: AppStyles.label,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ButtonWidget.primary(
                    onTap: () {},
                    content: 'ĐĂNG KÝ',
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
                    ButtonWidget.text(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      content: 'ĐĂNG NHẬP NGAY',
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
