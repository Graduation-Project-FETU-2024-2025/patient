part of 'doctors_cubit.dart';

@immutable
sealed class DoctorsState {}

final class DoctorsInitial extends DoctorsState {}

final class DoctorsLoading extends DoctorsState {}

final class DoctorsFailure extends DoctorsState {
  final ApiErrorModel apiErrorModel;

  DoctorsFailure({required this.apiErrorModel});
}

final class DoctorsSuccess extends DoctorsState {
  final List<DoctorModel> doctors;

  DoctorsSuccess({required this.doctors});
}
