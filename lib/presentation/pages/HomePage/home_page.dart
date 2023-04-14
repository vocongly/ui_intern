import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_intern/data/config/models/token.dart';
import 'package:ui_intern/presentation/bloc/authentication/authentication_cubit.dart';
import 'package:ui_intern/ulti/style/app_style.dart';

import '../../../ulti/helper/token_helper.dart';
import '../../components/button/button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ButtonWidget.primary(
                  onTap: () {
                    GetIt.instance.get<AuthenticationCubit>().logout(context);
                  },
                  content: 'Đăng xuất'),
            ],
          ),
        ),
      ),
    );
  }

}
