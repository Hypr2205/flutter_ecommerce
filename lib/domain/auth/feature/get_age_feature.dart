import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce/common/feature/feature.dart';
import 'package:flutter_ecommerce/dependency_injection.dart';
import 'package:flutter_ecommerce/domain/app_domains.dart';

class GetAgeFeature implements Feature<Either, void> {
  @override
  Future<Either> call({void params}) async {
    return sl<AuthRepository>().getAges();
  }
}
