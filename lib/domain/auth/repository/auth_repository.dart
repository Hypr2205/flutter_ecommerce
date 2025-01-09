import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce/data/app_data.dart';

abstract class AuthRepository {
  Future<Either> register(RegisterRequest request);
  Future<Either> login(LoginRequest request);
  Future<Either> getAges();
  Future<Either> sendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
}
