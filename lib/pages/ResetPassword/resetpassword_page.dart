import 'package:flutter/material.dart';
import 'package:ui_intern/components/default_button.dart';
import 'package:ui_intern/components/default_textbutton.dart';
import 'package:ui_intern/components/image_logo.dart';
import 'package:ui_intern/pages/Login/components/social_networking.dart';
import 'package:ui_intern/themes/app_colors.dart';

import '../../themes/app_style.dart';
import '../Login/components/password_form.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 16),
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
                  'Vui lòng nhập mật khẩu mới của bạn',
                  style: AppStyles.body1,
                ),
                SizedBox(height: 32,),
                PasswordForm(
                  passwordController: passwordController,
                  passwordVisible: _passwordVisible,
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  hintText: 'Nhập mật khẩu mới',
                  title: "Mật khẩu mới",
                ),
                PasswordForm(
                  passwordController: confirmpasswordController,
                  passwordVisible: _passwordconfirmVisible,
                  onPressed: () {
                    setState(() {
                      _passwordconfirmVisible = !_passwordconfirmVisible;
                    });
                  },
                  hintText: 'Nhập lại mật khẩu mới',
                  title: 'Xác thực mật khẩu',
                ),
                DefaultButton(onPressed: (){}, title: "ĐỔI MẬT KHẨU"),
                SocialNetworking()
              ],
            ),
            Center(child: TextButtonDefault(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Loginpage()));
            }, title: "< TRỞ VỀ ĐĂNG NHẬP"))
          ],
        ),
      )),
    );
  }
}
