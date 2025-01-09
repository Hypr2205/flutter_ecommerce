import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  Future<void> startup() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    emit(UnAuthenticated());
  }
}
