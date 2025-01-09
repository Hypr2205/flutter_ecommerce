import 'package:flutter_ecommerce/common/feature/feature.dart';
import 'package:flutter_ecommerce/dependency_injection.dart';
import 'package:flutter_ecommerce/domain/app_domains.dart';

class CheckAuthStatusFeature implements Feature<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return sl<AuthRepository>().isLoggedIn();
  }
}
