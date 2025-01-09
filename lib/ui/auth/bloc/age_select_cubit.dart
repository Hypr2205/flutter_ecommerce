import 'package:flutter_bloc/flutter_bloc.dart';

class AgeSelectCubit extends Cubit<String> {
  AgeSelectCubit() : super('Độ tuổi');

  String selectedAge = '';

  void selectAge(String age) {
    selectedAge = age;
    emit(selectedAge);
  }
}
