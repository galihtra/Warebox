import 'package:flutter/material.dart';
import 'package:warebox/utils/custom_themes.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/color_resources.dart';
import '../../utils/dimensions.dart';
import '../base_widgets/text_field/custom_password_textfield.dart';
import '../base_widgets/text_field/custom_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  GlobalKey<FormState>? _formKeyRegister;

  @override
  void initState() {
    super.initState();
    _formKeyRegister = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController!.dispose();
    _passwordController!.dispose();
    super.dispose();
  }

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passNode = FocusNode();

  // void loginUser() async {
  //   if (_formKeyLogin!.currentState!.validate()) {
  //     _formKeyLogin!.currentState!.save();

  //     String email = _emailController!.text.trim();
  //     String password = _passwordController!.text.trim();

  //     if (email.isEmpty) {
  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text('Email'),
  //         backgroundColor: Colors.red,
  //       ));
  //     } else if (password.isEmpty) {
  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text('Password'),
  //         backgroundColor: Colors.red,
  //       ));
  //     } else {
  //       final model = LoginRequestModel(
  //         email: email,
  //         password: password,
  //       );
  //       // context.read<LoginBloc>().add(LoginEvent.login(model));
  //     }
  //   }
  // }

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
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 50),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 5, right: 5),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sign Up', style: extraBold),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                alignment: Alignment.topLeft,
                child: Form(
                  key: _formKeyRegister,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        child: const Text(
                          'Email Address',
                          style: titleHeader2,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        child: CustomTextField(
                          hintText: 'youremail@gmail.com',
                          focusNode: _emailNode,
                          nextNode: _passNode,
                          textInputType: TextInputType.emailAddress,
                          controller: _emailController,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        child: const Text(
                          'Password',
                          style: titleHeader2,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        child: CustomPasswordTextField(
                          hintTxt: 'Password',
                          textInputAction: TextInputAction.done,
                          focusNode: _passNode,
                          controller: _passwordController,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        child: const Text(
                          'Confirm Password',
                          style: titleHeader2,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        child: CustomPasswordTextField(
                          hintTxt: 'Confirm Password',
                          textInputAction: TextInputAction.done,
                          focusNode: _passNode,
                          controller: _passwordController,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          right: Dimensions.marginSizeSmall,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: ColorResources.white,
                                  activeColor: Theme.of(context).primaryColor,
                                  value: false,
                                  onChanged: (val) {},
                                ),
                                const Text(
                                  'By continuing you accept our Privacy Policy and\nTerm of Use',
                                  style: titilliumRegular,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2E9496),
                            minimumSize: const Size(0, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sign Up',
                                style: pjsExtraBold20,
                              ),
                              SizedBox(width: 10),
                              Icon(Icons.person_2_outlined)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Stack(
                        alignment: const AlignmentDirectional(0, 0),
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 12, 0, 12),
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
                                style: pjsMedium16,
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
                                  horizontal:
                                      20), // Sesuaikan padding sesuai kebutuhan
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0xFFDCE1E8),
                                  width: 1,
                                ),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize
                                    .min, // Memastikan tombol hanya mengambil ruang yang dibutuhkan
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.google,
                                    color: Color(0xFF3D4966),
                                  ),
                                  SizedBox(
                                      width: 10), // Jarak antara ikon dan teks
                                  Text(
                                    'Sign Up with Google',
                                    style: titleHeader,
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
                            const Text(
                              'Already have an account? ',
                              style: pjsSemiBold16,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/login');
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent),
                              child: const Text(
                                'Sign In',
                                style: pjsExtraBold16RedUnderlined,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
