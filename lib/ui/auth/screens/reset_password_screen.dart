import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/common/app_commons.dart';
import 'package:flutter_ecommerce/domain/app_domains.dart';
import 'package:flutter_ecommerce/ui/auth/auth.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
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
                    style: const TextStyle(fontSize: 18),
                  ),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }

              if (state is ButtonSuccessState) {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const EmailConfirmScreen(),
                  ),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Center(
                    child: Text(
                      'THAY ĐỔI MẬT KHẨU',
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
                      hintText: 'Nhập email xác nhận',
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
                  Builder(
                    builder: (context) {
                      return CommonReactiveButton(
                        onPressed: () {
                          context.read<ButtonCubit>().execute(
                                feature: SendResetEmailFeature(),
                                params: _emailController.text,
                              );
                        },
                        title: 'Xác nhận',
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
