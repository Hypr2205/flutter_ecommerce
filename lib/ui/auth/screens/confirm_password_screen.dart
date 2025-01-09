import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/common/app_commons.dart';
import 'package:flutter_ecommerce/data/app_data.dart';
import 'package:flutter_ecommerce/domain/app_domains.dart';
import 'package:flutter_ecommerce/ui/app_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmPasswordScreen extends StatelessWidget {
  ConfirmPasswordScreen({required this.loginRequest, super.key});

  final _passwordController = TextEditingController();
  final LoginRequest loginRequest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const CommonAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 40,
        ),
        child: BlocProvider(
          create: (context) => ButtonCubit(),
          child: BlocListener<ButtonCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonFailState) {
                final snackbar = SnackBar(
                  content: Text(
                    state.errorMessage,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }

              if (state is ButtonSuccessState) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const HomeScreen(),
                  ),
                  (Route<dynamic> route) => false,
                );
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 25,
              children: [
                Center(
                  child: Text(
                    'XÁC NHẬN MẬT KHẨU',
                    style: GoogleFonts.robotoMono(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                PasswordTextFiled(passwordController: _passwordController),
                Builder(
                  builder: (context) {
                    return CommonReactiveButton(
                      onPressed: () {
                        loginRequest.password = _passwordController.text;
                        context.read<ButtonCubit>().execute(
                              feature: LoginFeature(),
                              params: loginRequest,
                            );
                      },
                      title: 'Đăng nhập',
                    );
                  },
                ),
                RichText(
                  text: TextSpan(
                    text: 'Quên mật khẩu?',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) => ResetPasswordScreen(),
                          ),
                        );
                      },
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
