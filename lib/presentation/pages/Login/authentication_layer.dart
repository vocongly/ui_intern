import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ui_intern/presentation/pages/HomePage/home_page.dart';
import 'package:ui_intern/presentation/pages/Login/login_page.dart';

import '../../bloc/authentication/authentication_cubit.dart';

class AuthenticationLayer extends StatelessWidget {
  const AuthenticationLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        if(state is UnAuthenticatedState){
          return const LoginPage();
        } 
        return const HomePage();
      },
    );
  }
}