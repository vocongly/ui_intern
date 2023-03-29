import 'package:flutter/material.dart';
import 'package:ui_intern/pages/Login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: myPrimaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage()
    );
  }
}

