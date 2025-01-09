import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/app_commons.dart';
import 'package:flutter_ecommerce/ui/auth/auth.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmPasswordScreen extends StatelessWidget {
  ConfirmPasswordScreen({super.key});
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const CommonAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
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
            CommonButton(
              onPressed: () {},
              title: 'Đăng nhập',
              trailingIcon: Icons.arrow_forward,
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
    );
  }
}
