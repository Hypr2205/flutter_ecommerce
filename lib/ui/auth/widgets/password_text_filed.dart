import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordTextFiled extends StatefulWidget {
  const PasswordTextFiled({
    required this.passwordController,
    super.key,
  });

  final TextEditingController passwordController;

  @override
  State<PasswordTextFiled> createState() => _PasswordTextFiledState();
}

class _PasswordTextFiledState extends State<PasswordTextFiled> {
  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.passwordController,
      obscureText: _obsecureText,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: 'Nhập mật khẩu',
        label: Text(
          'Mật khẩu',
          style: GoogleFonts.robotoMono(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obsecureText = !_obsecureText;
            });
          },
          icon: Icon(_obsecureText ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }
}
