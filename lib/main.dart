import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_intern/presentation/bloc/authentication/authentication_cubit.dart';
import 'package:ui_intern/presentation/bloc/authentication/login/login_cubit.dart';

import 'app.dart';
import 'data/config/dependency.dart/dependency.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setOrientations();
  HttpOverrides.global = MyHttpOverrides();
  await configureDependencies();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void setOrientations() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: GetIt.instance.get<AuthenticationCubit>()),
        BlocProvider.value(value: GetIt.instance.get<LoginCubit>()),
      ],
      child: const App(),
    );
  }
}

