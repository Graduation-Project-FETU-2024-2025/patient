part of 'get_specialities_cubit.dart';

@immutable
sealed class GetSpecialitiesState {}

final class GetSpecialitiesInitial extends GetSpecialitiesState {}

final class GetSpecialitiesLoading extends GetSpecialitiesState {}

final class GetSpecialitiesSuccess extends GetSpecialitiesState {
  final List<SpecialitiesModel> specialities;
  GetSpecialitiesSuccess({required this.specialities});
}

final class GetSpecialitiesError extends GetSpecialitiesState {
  final ApiErrorModel errorModel;
  GetSpecialitiesError({required this.errorModel});
}
