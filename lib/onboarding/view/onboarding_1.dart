import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const Onboarding1());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F9),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/Monotone_health_plus.png',
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome to\n',
                    style: GoogleFonts.getFont(
                      'Plus Jakarta Sans',
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                    ),
                  ),
                  TextSpan(
                    text: 'Ware ',
                    style: GoogleFonts.getFont(
                      'Plus Jakarta Sans',
                      color: const Color(0xFF2E9496),
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                    ),
                  ),
                  TextSpan(
                    text: 'Box',
                    style: GoogleFonts.getFont(
                      'Plus Jakarta Sans',
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                    ),
                  ),
                  TextSpan(
                    text: '\n\nModern Warehouse Rental Solutions!',
                    style: GoogleFonts.getFont(
                      'Plus Jakarta Sans',
                      color: const Color(0xFF3D4966),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/Group.png',
                    width: 393,
                    height: 480,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0, // Ubah posisi tombol sesuai kebutuhan
                  left: 100,
                  right: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      // Tindakan yang ingin Anda jalankan saat tombol ditekan
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(187, 56),
                        backgroundColor: const Color(
                            0xFF2E9496), // Warna latar belakang tombol
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12)) // Sesuaikan padding tombol sesuai kebutuhan
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Get Started',
                          style: GoogleFonts.getFont('Plus Jakarta Sans',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(width: 15), // Jarak antara teks dan ikon
                        const Icon(
                            Icons.arrow_forward), // Ikon di sebelah kanan
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: GoogleFonts.getFont('Plus Jakarta Sans',
                        color: const Color(0xFF818BA0),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent),
                    child: Text(
                      'Sign in',
                      style: GoogleFonts.getFont(
                        'Plus Jakarta Sans',
                        color: const Color(0xFFFA4D5E),
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
