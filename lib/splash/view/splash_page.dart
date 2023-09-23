import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    // Prevent screen rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // Lock portrait orientation
    ]);

    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(
            16 * fem, 0, 16 * fem, 30 * fem), // Use EdgeInsets.symmetric
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(32 * fem),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 250 * fem), // Use fem for dynamic sizing
            Container(
              margin: EdgeInsets.only(bottom: 20 * fem),
              width: 216 * fem,
              height: 203.88 * fem,
              child: Image.asset(
                'assets/images/Logo_Warebox.png',
                width: 216 * fem,
                height: 203.88 * fem,
              ),
            ),
            const Spacer(), // Adds space in between
            Container(
              margin: EdgeInsets.only(bottom: 10 * fem),
              child: Text(
                'By',
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16 * ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.6, // Use a fixed value for height
                  color: const Color(0xff3d4966),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20 * fem),
              child: Text(
                'WAREBOX',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 30 * ffem,
                  fontWeight: FontWeight.w800,
                  height: 1.27, // Use a fixed value for height
                  letterSpacing: -1.2 * fem,
                  color: const Color(0xff090d1d),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
