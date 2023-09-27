import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warebox/pages/auth/sign_in_page.dart';
import 'package:warebox/utils/custom_themes.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../bloc/register/register_bloc.dart';
import '../../data/datasources/auth_local_datasource.dart';
import '../../data/models/request/register_request_model.dart';
import '../../utils/color_resources.dart';
import '../../utils/dimensions.dart';
import '../base_widgets/text_field/custom_name_textfield.dart';
import '../base_widgets/text_field/custom_password_textfield.dart';
import '../base_widgets/text_field/custom_textfield.dart';
import '../dashboard/dashboard_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  GlobalKey<FormState>? _formKey;

  final FocusNode _fNameFocus = FocusNode();
  final FocusNode _lNameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  bool isEmailVerified = false;

  addUser() async {
    if (_formKey!.currentState!.validate()) {
      _formKey!.currentState!.save();
      final model = RegisterRequestModel(
        email: _emailController.text,
        password: _passwordController.text,
        name: _firstNameController.text,
      );
      context.read<RegisterBloc>().add(RegisterEvent.register(model));
      isEmailVerified = true;
    } else {
      isEmailVerified = false;
    }
  }

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();
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
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        child: const Text(
                          'Name',
                          style: titleHeader2,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        child: CustomNameTextField(
                          hintText: 'Name',
                          textInputType: TextInputType.name,
                          focusNode: _fNameFocus,
                          nextNode: _lNameFocus,
                          isPhoneNumber: false,
                          capitalization: TextCapitalization.words,
                          controller: _firstNameController,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Email
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
                          focusNode: _emailFocus,
                          nextNode: _phoneFocus,
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
                          focusNode: _passwordFocus,
                          controller: _passwordController,
                          nextNode: _confirmPasswordFocus,
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
                          focusNode: _confirmPasswordFocus,
                          controller: _confirmPasswordController,
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
                        margin: const EdgeInsets.only(
                          left: Dimensions.marginSizeLarge,
                          right: Dimensions.marginSizeLarge,
                          bottom: Dimensions.marginSizeLarge,
                          top: Dimensions.marginSizeLarge,
                        ),
                        child: BlocListener<RegisterBloc, RegisterState>(
                          listener: (context, state) {
                            state.maybeWhen(
                              orElse: () {},
                              error: (message) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(message)),
                                );
                              },
                              loaded: (data) async {
                                await AuthLocalDatasource().saveAuthData(data);
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DashboardPage();
                                }), (route) => false);
                              },
                            );
                          },
                          child: BlocBuilder<RegisterBloc, RegisterState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                orElse: () {
                                  return ElevatedButton(
                                    onPressed: addUser,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF2E9496),
                                      minimumSize: const Size(0, 50),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Sign Up',
                                          style: pjsExtraBold20,
                                        ),
                                        SizedBox(width: 10),
                                        Icon(Icons.person_2_outlined),
                                      ],
                                    ),
                                  );
                                },
                                loading: () => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            },
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const LoginPage();
                                    },
                                  ),
                                );
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
