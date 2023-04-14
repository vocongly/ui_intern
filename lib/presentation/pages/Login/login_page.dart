// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_intern/presentation/bloc/authentication/login/login_cubit.dart';
import 'package:ui_intern/presentation/pages/Signup/signup_page.dart';

import '../../../ulti/style/app_assets.dart';
import '../../../ulti/style/app_colors.dart';
import '../../../ulti/style/app_style.dart';
import '../../bloc/authentication/authentication_cubit.dart';
import '../../components/button/button_widget.dart';
import '../../components/image/image_logo.dart';
import '../../components/textfield/textfield_widget.dart';
import 'components/social_networking.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginpageState();
}

class _LoginpageState extends State<LoginPage> {
  late bool _passwordVisible;

  late Stream loginCubitStream;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _emailErrorText;
  String? _passwordErrorText;
  String? _loginErrorText;

  @override
  void initState() {
    _passwordVisible = false;
    _emailController.text = "customer1@tma.com.vn";
    _passwordController.text = "12345678x@X";
    loginCubitStream = GetIt.instance.get<LoginCubit>().stream;
    loginCubitStream.listen((event) {
      setState(() {
        _emailErrorText = null;
        _passwordErrorText = null;
      });
      if (!mounted) return;
      if (event is DisconnectState) {
        setState(() => _loginErrorText =
            "Không kết nối được với server. Vui lòng thử lại !!");
        return;
      }
      if (event is ErrorState) {
        setState(() =>
            _loginErrorText = "Có lỗi khi tải dữ liệu. Vui lòng thử lại !!");
        return;
      }
      if (event is WrongLoginInfoState) {
        setState(() => _loginErrorText = "Có lỗi với email hoặc password !!");
        return;
      }
      if (event is InvaildUsernameState) {
        setState(() => _emailErrorText = "${event.content}!");
        return;
      }
      if (event is InvaildPasswordState) {
        setState(() => _passwordErrorText = "${event.content}!");
        return;
      }
    });
    super.initState();
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
                  TextfieldWidget.common(
                      onChanged: (value) {},
                      textEditingController: _emailController,
                      title: 'Email',
                      required: true,
                      prefixIconPath: AppAssets.ic_email,
                      hintText: "Nhập email của bạn",
                      textStyle: AppStyles.body1,
                      iconColor: AppColors.black,
                      hintStyle:
                          AppStyles.body1.copyWith(color: AppColors.tertiary),
                      titleStyle:
                          AppStyles.label.copyWith(fontWeight: FontWeight.bold),
                      disableTextColor: Colors.black,
                      disableBackgroundColor: Colors.grey),
                  const SizedBox(
                    height: 16,
                  ),
                  TextfieldWidget.common(
                      onChanged: (value) {},
                      textEditingController: _passwordController,
                      title: 'Mật khẩu',
                      required: true,
                      isObscured: !_passwordVisible,
                      prefixIconPath: AppAssets.ic_password,
                      suffixIconPath: _passwordVisible
                          ? AppAssets.ic_eye_line
                          : AppAssets.ic_eye_close_line,
                      onSuffixIconTap: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      hintText: "Nhập mật khẩu của bạn",
                      textStyle: AppStyles.body1,
                      iconColor: AppColors.black,
                      hintStyle:
                          AppStyles.body1.copyWith(color: AppColors.tertiary),
                      titleStyle:
                          AppStyles.label.copyWith(fontWeight: FontWeight.bold),
                      disableTextColor: Colors.black,
                      disableBackgroundColor: Colors.grey),
                  Align(
                      alignment: Alignment.centerRight,
                      child: ButtonWidget.text(
                          onTap: () {},
                          content: 'QUÊN MẬT KHẨU?',
                          textStyle: AppStyles.button)),
                  const SizedBox(
                    height: 32,
                  ),
                  ButtonWidget.primary(
                    onTap: () {
                      login();
                    },
                    content: 'ĐĂNG NHẬP',
                    borderRadius: 8,
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
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupPage()));
                      },
                      content: 'ĐĂNG KÝ NGAY',
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

  Future<void> login() async {
    GetIt.instance.get<AuthenticationCubit>().login(
        context: context,
        username: _emailController.text,
        password: _passwordController.text,
        state: this);
  }
}
