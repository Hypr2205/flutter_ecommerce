import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/configs/app_configs.dart';
import 'package:flutter_ecommerce/ui/app_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(builder: (context) => LoginScreen()),
          );
        }
      },
      child: Scaffold(
        backgroundColor: ColorConfig.primary,
        body: Center(
          child: SvgPicture.asset(
            AssetsConfig.appLogo,
          ),
        ),
      ),
    );
  }
}
