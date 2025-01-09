import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/common/app_commons.dart';
import 'package:flutter_ecommerce/configs/app_configs.dart';
import 'package:flutter_ecommerce/data/app_data.dart';
import 'package:flutter_ecommerce/domain/app_domains.dart';
import 'package:flutter_ecommerce/ui/app_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class UserInformationScreen extends StatelessWidget {
  const UserInformationScreen({required this.registerRequest, super.key});

  final RegisterRequest registerRequest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GenderSelectCubit()),
          BlocProvider(create: (context) => AgeSelectCubit()),
          BlocProvider(create: (context) => AgeDisplayCubit()),
          BlocProvider(create: (context) => ButtonCubit()),
        ],
        child: BlocListener<ButtonCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonFailState) {
              final snackbar = SnackBar(
                content: Text(
                  state.errorMessage,
                  style: const TextStyle(fontSize: 15),
                ),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 40,
                ),
                child: Column(
                  spacing: 30,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'THÔNG TIN CÁ NHÂN',
                        style: GoogleFonts.robotoMono(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    BlocBuilder<GenderSelectCubit, int>(
                      builder: (context, state) {
                        return Row(
                          spacing: 20,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  context
                                      .read<GenderSelectCubit>()
                                      .selectGender(1);
                                },
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: context
                                                .read<GenderSelectCubit>()
                                                .selectedIndex ==
                                            1
                                        ? ColorConfig.primary
                                        : ColorConfig.secondBackground,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Nam',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  context
                                      .read<GenderSelectCubit>()
                                      .selectGender(2);
                                },
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: context
                                                .read<GenderSelectCubit>()
                                                .selectedIndex ==
                                            2
                                        ? ColorConfig.primary
                                        : ColorConfig.secondBackground,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Nữ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const Text(
                      'Tuổi của bạn',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    BlocBuilder<AgeSelectCubit, String>(
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            AppBottomsheet.display(
                              context,
                              MultiBlocProvider(
                                providers: [
                                  BlocProvider.value(
                                    value: context.read<AgeSelectCubit>(),
                                  ),
                                  BlocProvider.value(
                                    value: context.read<AgeDisplayCubit>()
                                      ..displayAges(),
                                  ),
                                ],
                                child: const Ages(),
                              ),
                            );
                          },
                          child: Container(
                            height: 60,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: ColorConfig.secondBackground,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(state),
                                const Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: 100,
                color: ColorConfig.secondBackground,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Builder(
                    builder: (context) {
                      return CommonReactiveButton(
                        onPressed: () {
                          registerRequest
                            ..gender =
                                context.read<GenderSelectCubit>().selectedIndex
                            ..age = context.read<AgeSelectCubit>().selectedAge;
                          context.read<ButtonCubit>().execute(
                                feature: RegisterFeature(),
                                params: registerRequest,
                              );
                        },
                        title: 'Hoàn tất',
                      );
                    },
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
