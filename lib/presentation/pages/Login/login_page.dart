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
  bool _isHidePassword = true;

  late Stream loginCubitStream;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _emailErrorText;
  String? _passwordErrorText;
  String? _loginErrorText;

  @override
  void initState() {
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
                      onChanged: (value) {
                        clearError();
                      },
                      textEditingController: _emailController,
                      title: 'Email',
                      required: true,
                      prefixIconPath: AppAssets.ic_email,
                      hintText: "Nhập email của bạn",
                      textStyle: AppStyles.body1,
                      errorText: _emailErrorText,
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
                      onChanged: (value) {
                        clearError();
                      },
                      textEditingController: _passwordController,
                      title: 'Mật khẩu',
                      required: true,
                      errorText: _passwordErrorText,
                      isObscured: _isHidePassword,
                      prefixIconPath: AppAssets.ic_password,
                      suffixIconPath: !_isHidePassword
                          ? AppAssets.ic_eye_line
                          : AppAssets.ic_eye_close_line,
                      onSuffixIconTap: () {
                        updateHidePasswordState();
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
                  if (_loginErrorText != null)
                    Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text(_loginErrorText!,
                            style:
                                AppStyles.body2.copyWith(color: Colors.red))),
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
    unFocus();
    resetHidePasswordState();
    GetIt.instance.get<AuthenticationCubit>().login(
        context: context,
        username: _emailController.text,
        password: _passwordController.text,
        state: this);
  }

  void clearError() async {
    setState(() {
      _emailErrorText = null;
      _passwordErrorText = null;
      _loginErrorText = null;
    });
  }

  void resetHidePasswordState() {
    setState(() {
      _isHidePassword = true;
    });
  }

  void updateHidePasswordState() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  void unFocus() {
    FocusScope.of(context).unfocus();
  }
}
