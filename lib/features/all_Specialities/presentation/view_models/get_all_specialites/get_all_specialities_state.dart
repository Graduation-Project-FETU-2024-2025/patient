part of 'get_all_specialities_cubit.dart';

@immutable
sealed class GetAllSpecialitiesState {}

final class GetAllSpecialitiesInitial extends GetAllSpecialitiesState {}

final class GetAllSpecialitiesLoading extends GetAllSpecialitiesState {}

final class GetAllSpecialitiesSucess extends GetAllSpecialitiesState {
  final List<SpecialitiesModel> specialitiesList;
  GetAllSpecialitiesSucess({required this.specialitiesList});
}

final class GetAllSpecialitiesFailure extends GetAllSpecialitiesState {
  final ApiErrorModel apiErrorModel;

  GetAllSpecialitiesFailure({required this.apiErrorModel});
}
