import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce/common/feature/feature.dart';
import 'package:flutter_ecommerce/data/app_data.dart';
import 'package:flutter_ecommerce/dependency_injection.dart';
import 'package:flutter_ecommerce/domain/auth/auth_domain.dart';

class RegisterFeature implements Feature<Either, RegisterRequest> {
  @override
  Future<Either> call({RegisterRequest? params}) async {
    return sl<AuthRepository>().register(params!);
  }
}
