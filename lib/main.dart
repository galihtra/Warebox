import 'package:flutter/material.dart';
import 'package:warebox/pages/auth/sign_in_page.dart';
import 'package:warebox/pages/auth/sign_up_page.dart';
import 'package:warebox/pages/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WareBox Demo',
      home: const SplashPage(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => const LoginPage(),
        '/register': (BuildContext context) => const RegisterPage(),
      },
    );
  }
}
