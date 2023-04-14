import 'package:flutter/material.dart';
import 'package:ui_intern/presentation/pages/Login/authentication_layer.dart';

class App extends StatelessWidget {
  const App({super.key});

  final MaterialColor myPrimaryColor = const MaterialColor(0xff5C44F0, <int, Color>{
      50: Color(0xff5C44F0),
      100: Color(0xff5C44F0),
      200: Color(0xff5C44F0),
      300: Color(0xff5C44F0),
      400: Color(0xff5C44F0),
      500: Color(0xff5C44F0),
      600: Color(0xff5C44F0),
      700: Color(0xff5C44F0),
      800: Color(0xff5C44F0),
      900: Color(0xff5C44F0),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: myPrimaryColor),
      home: const AuthenticationLayer()
    );
  }
}