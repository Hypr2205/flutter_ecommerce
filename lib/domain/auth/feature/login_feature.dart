import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce/common/feature/feature.dart';
import 'package:flutter_ecommerce/data/app_data.dart';
import 'package:flutter_ecommerce/dependency_injection.dart';
import 'package:flutter_ecommerce/domain/app_domains.dart';

class LoginFeature implements Feature<Either, LoginRequest> {
  @override
  Future<Either> call({LoginRequest? params}) async {
    return sl<AuthRepository>().login(params!);
  }
}
