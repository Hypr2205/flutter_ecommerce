import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/app_commons.dart';
import 'package:flutter_ecommerce/configs/app_configs.dart';
import 'package:flutter_ecommerce/ui/app_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmailConfirmScreen extends StatelessWidget {
  const EmailConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 30,
        children: [
          Center(
            child: SvgPicture.asset(
              AssetsConfig.emailSending,
            ),
          ),
          const Center(
            child: Text(
              'Vui lòng kiểm tra email để xác thực thay đổi mật khẩu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CommonButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            title: 'Quay về đăng nhập',
            width: 200,
            trailingIcon: Icons.arrow_back,
          ),
        ],
      ),
    );
  }
}
