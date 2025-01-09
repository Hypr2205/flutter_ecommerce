import 'package:flutter_ecommerce/data/app_data.dart';
import 'package:flutter_ecommerce/domain/app_domains.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> injectDependencies() async {
  sl
    ..registerSingleton<FirebaseAuthService>(FirebaseAuthService())
    ..registerSingleton<AuthRepository>(AuthRepositoryImpl())
    ..registerSingleton<RegisterFeature>(RegisterFeature())
    ..registerSingleton<LoginFeature>(LoginFeature())
    ..registerSingleton<GetAgeFeature>(GetAgeFeature())
    ..registerSingleton<GetUserFeature>(GetUserFeature())
    ..registerSingleton<CheckAuthStatusFeature>(CheckAuthStatusFeature())
    ..registerSingleton<SendResetEmailFeature>(SendResetEmailFeature());
}
