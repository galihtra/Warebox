import 'package:flutter/material.dart';
import 'package:warebox/utils/custom_themes.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F9),
      body: SingleChildScrollView(
        child: Center(
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
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome to\n',
                      style: pjsExtraBold30,
                    ),
                    TextSpan(
                      text: 'Ware ',
                      style: pjsExtraBold30Grey,
                    ),
                    TextSpan(text: 'Box', style: pjsExtraBold30),
                    TextSpan(
                      text: '\n\nModern Warehouse Rental Solutions!',
                      style: pjsSemiBold16,
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
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Get Started',
                            style: pjsExtraBold20,
                          ),
                          SizedBox(width: 15), // Jarak antara teks dan ikon
                          Icon(Icons.arrow_forward), // Ikon di sebelah kanan
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
                    const Text(
                      'Already have an account?',
                      style: pjsSemiBold16,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/login');
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent),
                      child: const Text(
                        'Sign in',
                        style: pjsExtraBold16RedUnderlined,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
