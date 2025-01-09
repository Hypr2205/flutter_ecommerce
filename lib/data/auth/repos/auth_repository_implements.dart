import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce/data/auth/auth_data.dart';
import 'package:flutter_ecommerce/dependency_injection.dart';
import 'package:flutter_ecommerce/domain/app_domains.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either> getAges() {
    return sl<FirebaseAuthService>().getAges();
  }

  @override
  Future<Either> getUser() {
    return sl<FirebaseAuthService>().getUser();
  }

  @override
  Future<bool> isLoggedIn() {
    return sl<FirebaseAuthService>().isLoggedIn();
  }

  @override
  Future<Either> login(LoginRequest request) {
    return sl<FirebaseAuthService>().login(request);
  }

  @override
  Future<Either> register(RegisterRequest request) async {
    return sl<FirebaseAuthService>().register(request);
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) {
    return sl<FirebaseAuthService>().sendPasswordResetEmail(email);
  }
}
