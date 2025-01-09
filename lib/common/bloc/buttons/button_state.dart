part of 'button_cubit.dart';

@immutable
sealed class ButtonState {}

class ButtonInitialState extends ButtonState {}

class ButtonLoadingState extends ButtonState {}

class ButtonSuccessState extends ButtonState {}

class ButtonFailState extends ButtonState {
  ButtonFailState({required this.errorMessage});
  final String errorMessage;
}
