import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warebox/bloc/login/login_bloc.dart';
import 'package:warebox/bloc/logout/logout_bloc.dart';
import 'package:warebox/bloc/register/register_bloc.dart';
import 'package:warebox/data/datasources/auth_local_datasource.dart';
import 'package:warebox/pages/auth/sign_in_page.dart';
import 'package:warebox/pages/dashboard/dashboard_page.dart';
import 'package:warebox/pages/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(),
        ),
      ],
      child: MaterialApp(
          title: 'WareBox Demo',
          debugShowCheckedModeBanner: false,
          home: FutureBuilder<bool>(
            future: AuthLocalDatasource().isLogin(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasData && snapshot.data!) {
                return const DashboardPage();
              } else {
                return const LoginPage();
              }
            },
          )),
    );
  }
}
