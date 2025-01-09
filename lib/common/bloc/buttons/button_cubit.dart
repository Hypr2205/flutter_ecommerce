import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce/common/feature/feature.dart';
import 'package:meta/meta.dart';

part 'button_state.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonInitialState());

  Future<void> execute({required Feature feature, dynamic params}) async {
    emit(ButtonLoadingState());
    try {
      final _ = await feature.call(params: params) as Either
        ..fold((error) {
          emit(
            ButtonFailState(
              errorMessage: error as String,
            ),
          );
        }, (data) {
          emit(ButtonSuccessState());
        });
    } catch (e) {
      emit(
        ButtonFailState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
