import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce/common/feature/feature.dart';
import 'package:flutter_ecommerce/dependency_injection.dart';
import 'package:flutter_ecommerce/domain/app_domains.dart';

class GetUserFeature implements Feature<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return sl<AuthRepository>().getUser();
  }
}
