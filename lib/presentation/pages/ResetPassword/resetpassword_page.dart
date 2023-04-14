import 'package:flutter/material.dart';
import 'package:ui_intern/presentation/pages/Login/components/social_networking.dart';

import '../../../ulti/style/app_assets.dart';
import '../../../ulti/style/app_colors.dart';
import '../../../ulti/style/app_style.dart';
import '../../components/button/button_widget.dart';
import '../../components/image/image_logo.dart';
import '../../components/textfield/textfield_widget.dart';
import '../Login/login_page.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {

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
                TextfieldWidget.common(
                  textEditingController: passwordController,
                  isObscured: _passwordVisible,
                  errorText: 'Mật khẩu phải ít nhất 8 kí tự',
                  suffixIconPath: AppAssets.ic_eye_close_line,
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
                  hintStyle: AppStyles.body1.copyWith(color: AppColors.gray),
                  onChanged: (value) {},
                  textStyle: AppStyles.body1,
                  titleStyle: AppStyles.label,
                ),
                TextfieldWidget.common(
                  textEditingController: passwordController,
                  isObscured: _passwordconfirmVisible,
                  errorText: 'Mật khẩu phải ít nhất 8 kí tự',
                  suffixIconPath: AppAssets.ic_eye_close_line,
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
                  hintStyle: AppStyles.body1.copyWith(color: AppColors.gray),
                  onChanged: (value) {},
                  textStyle: AppStyles.body1,
                  titleStyle: AppStyles.label,
                ),
                const SizedBox(
                  height: 32,
                ),
                ButtonWidget.primary(
                  onTap: () {},
                  content: "ĐỔI MẬT KHẨU",
                ),
                const SocialNetworking()
              ],
            ),
            ButtonWidget.text(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              content: "TRỞ VỀ ĐĂNG NHẬP",
              preIconUrl: AppAssets.ic_arow_left,
            )
          ],
        ),
      )),
    );
  }
}
