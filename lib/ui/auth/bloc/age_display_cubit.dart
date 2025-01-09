import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecommerce/dependency_injection.dart';
import 'package:flutter_ecommerce/domain/auth/feature/get_age_feature.dart';
import 'package:meta/meta.dart';

part 'age_display_state.dart';

class AgeDisplayCubit extends Cubit<AgeDisplayState> {
  AgeDisplayCubit() : super(Loading());

  Future<void> displayAges() async {
    final data = await sl<GetAgeFeature>().call();

    data.fold((message) {
      emit(
        LoadFailed(message: message as String),
      );
    }, (data) {
      emit(
        Loaded(ages: data as List<QueryDocumentSnapshot<Map<String, dynamic>>>),
      );
    });
  }
}
