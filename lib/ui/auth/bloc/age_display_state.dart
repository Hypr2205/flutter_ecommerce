part of 'age_display_cubit.dart';

@immutable
sealed class AgeDisplayState {}

final class Loading extends AgeDisplayState {}

final class Loaded extends AgeDisplayState {
  Loaded({required this.ages});
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> ages;
}

final class LoadFailed extends AgeDisplayState {
  LoadFailed({required this.message});
  final String message;
}
