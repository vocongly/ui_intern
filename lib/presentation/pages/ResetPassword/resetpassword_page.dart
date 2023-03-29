import 'package:flutter/material.dart';
import 'package:ui_intern/presentation/components/button_widget.dart';
import 'package:ui_intern/presentation/components/image_logo.dart';
import 'package:ui_intern/presentation/pages/Login/components/social_networking.dart';

import '../../../ulti/style/app_assets.dart';
import '../../../ulti/style/app_colors.dart';
import '../../../ulti/style/app_style.dart';
import '../../components/base_textform.dart';
import '../Login/login_page.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final bool _isCorretPassword = true;

  bool _passwordVisible = false;
  bool _passwordconfirmVisible = false;

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
                  'Quên mật khẩu',
                  style: AppStyles.heading3,
                ),
                const Text(
                  'Vui lòng nhập mật khẩu mới của bạn',
                  style: AppStyles.body1,
                ),
                const SizedBox(
                  height: 32,
                ),
                BaseTextForm(
                  controller: passwordController,
                  passwordVisible: _passwordVisible,
                  isCorretValid: _isCorretPassword,
                  errorText: 'Mật khẩu phải ít nhất 8 kí tự',
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  hintText: 'Nhập mật khẩu mới',
                  title: "Mật khẩu mới",
                ),
                BaseTextForm(
                  controller: confirmpasswordController,
                  passwordVisible: _passwordconfirmVisible,
                  isCorretValid: _isCorretPassword,
                  errorText: 'Mật khẩu phải ít nhất 8 kí tự',
                  onPressed: () {
                    setState(() {
                      _passwordconfirmVisible = !_passwordconfirmVisible;
                    });
                  },
                  hintText: 'Nhập lại mật khẩu mới',
                  title: 'Xác thực mật khẩu',
                ),
                const SizedBox(height: 32,),
                ButtonWidget.primary(
                  onPressed: () {},
                  title: "ĐỔI MẬT KHẨU",
                ),
                const SocialNetworking()
              ],
            ),
            ButtonWidget.text(
              onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              title: "TRỞ VỀ ĐĂNG NHẬP",
              preIconUrl: AppAssets.ic_arow_left,
            )
          ],
        ),
      )),
    );
  }
}
