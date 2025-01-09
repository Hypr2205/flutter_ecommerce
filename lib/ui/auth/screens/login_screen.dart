import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/app_commons.dart';
import 'package:flutter_ecommerce/ui/auth/auth.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const CommonAppBar(hideBack: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 25,
          children: [
            Center(
              child: Text(
                'ĐĂNG NHẬP',
                style: GoogleFonts.robotoMono(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Nhập email',
                label: Text(
                  'Email',
                  style: GoogleFonts.robotoMono(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                prefixIcon: const Icon(Icons.mail),
              ),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            CommonButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => ConfirmPasswordScreen(),
                  ),
                );
              },
              title: 'Tiếp tục',
              trailingIcon: Icons.arrow_forward,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Chưa có tài khoản? ',
                    style: TextStyle(fontSize: 18),
                  ),
                  TextSpan(
                    text: 'Đăng ký ngay',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            builder: (coxtext) => RegisterScreen(),
                          ),
                        );
                      },
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
