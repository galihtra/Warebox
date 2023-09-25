import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:warebox/login/login.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Login')),
      backgroundColor: const Color(0xFFF2F5F9),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign In',
                      style: GoogleFonts.getFont(
                        'Plus Jakarta Sans',
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        height: 1.2666666667,
                        letterSpacing: -1.2,
                        color: const Color(0xff090d1d),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Sign in and get your space personalized \nwith our Warehouse.',
                  style: GoogleFonts.getFont(
                    'Plus Jakarta Sans',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.6000000238,
                    color: const Color(0xff5d6985),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              BlocProvider(
                create: (context) {
                  return LoginBloc(
                    authenticationRepository:
                        RepositoryProvider.of<AuthenticationRepository>(
                            context),
                  );
                },
                child: const LoginForm(),
              ),
              const SizedBox(height: 50),
              Stack(
                alignment: const AlignmentDirectional(0, 0),
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.00, 0.00),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                      child: Container(
                        width: double.infinity,
                        height: 2,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE0E3E7),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.00, 0.00),
                    child: Container(
                      width: 70,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF2F5F9),
                      ),
                      alignment: const AlignmentDirectional(0.00, 0.00),
                      child: const Text(
                        'OR',
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                alignment: Alignment.center,
                child: Material(
                  elevation: 0, // Efek naik ketika tombol ditekan
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFF2F5F9),
                  child: InkWell(
                    onTap: () {
                      // Tindakan yang ingin Anda jalankan saat tombol ditekan
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Ink(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25,
                          horizontal: 20), // Sesuaikan padding sesuai kebutuhan
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFDCE1E8),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize
                            .min, // Memastikan tombol hanya mengambil ruang yang dibutuhkan
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.google,
                            color: Color(0xFF3D4966),
                          ),
                          const SizedBox(
                              width: 10), // Jarak antara ikon dan teks
                          Text(
                            'Sign In with Google',
                            style: GoogleFonts.getFont(
                              'Plus Jakarta Sans',
                              color: const Color(0xFF3D4966),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account? ',
                      style: GoogleFonts.getFont('Plus Jakarta Sans',
                          color: const Color(0xFF818BA0),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/login');
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent),
                      child: Text(
                        'Sign Up',
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
      ),
    );
  }
}
