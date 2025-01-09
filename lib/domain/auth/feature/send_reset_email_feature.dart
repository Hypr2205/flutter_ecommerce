import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce/common/feature/feature.dart';
import 'package:flutter_ecommerce/dependency_injection.dart';
import 'package:flutter_ecommerce/domain/app_domains.dart';

class SendResetEmailFeature implements Feature<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return sl<AuthRepository>().sendPasswordResetEmail(params!);
  }
}
