import 'package:flutter/material.dart';
import 'package:warebox/pages/splash/widgets/splash_painter.dart';
import 'package:warebox/utils/custom_themes.dart';
import 'package:warebox/utils/dimensions.dart';
import 'dart:async';
import 'package:warebox/pages/auth/sign_in_page.dart';

import '../../../utils/color_resources.dart';
import '../../../utils/images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashPage> {
  final GlobalKey<ScaffoldMessengerState> _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // Tunggu selama 2 detik, lalu navigasi ke halaman login
    Timer(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: ColorResources.getPrimary(context),
            child: CustomPaint(
              painter: SplashPainter(),
            ),
          ),
          Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    Images.splashLogo,
                    height: Dimensions.imageSplash,
                    fit: BoxFit.scaleDown,
                    width: Dimensions.imageSplash,
                  ),
                ),
              ),
              const Spacer(),
              const Column(
                children: [
                  Text("By", style: titilliumRegular),
                  Text("WAREBOX", style: extraBold),
                  SizedBox(
                    height: Dimensions.marginSizeAuthSmall,
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
