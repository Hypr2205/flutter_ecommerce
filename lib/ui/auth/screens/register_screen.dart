import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/app_commons.dart';
import 'package:flutter_ecommerce/data/app_data.dart';
import 'package:flutter_ecommerce/ui/auth/auth.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const CommonAppBar(hideBack: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 25,
          children: [
            Center(
              child: Text(
                'ĐĂNG KÝ TÀI KHOẢN',
                style: GoogleFonts.robotoMono(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                hintText: 'Họ',
                prefixIcon: Icon(Icons.mail),
              ),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                hintText: 'Tên',
                prefixIcon: Icon(Icons.mail),
              ),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Nhập email',
                prefixIcon: Icon(Icons.mail),
              ),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            PasswordTextFiled(passwordController: _passwordController),
            CommonButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => UserInformationScreen(
                      registerRequest: RegisterRequest(
                        firstName: _firstNameController.text,
                        email: _emailController.text,
                        lastName: _lastNameController.text,
                        password: _passwordController.text,
                      ),
                    ),
                  ),
                );
              },
              title: 'Đăng ký',
              trailingIcon: Icons.check,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Đã có tài khoản? ',
                    style: TextStyle(fontSize: 18),
                  ),
                  TextSpan(
                    text: 'Đăng nhập ngay',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            builder: (coxtext) => LoginScreen(),
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
