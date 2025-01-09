import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/configs/app_configs.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.primary,
      body: Center(
        child: SvgPicture.asset(
          AssetsConfig.appLogo,
        ),
      ),
    );
  }
}
