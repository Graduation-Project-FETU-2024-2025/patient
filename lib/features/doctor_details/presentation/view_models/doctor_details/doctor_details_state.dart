part of 'doctor_details_cubit.dart';

@immutable
sealed class DoctorDetailsState {}

final class DoctorDetailsInitial extends DoctorDetailsState {}

final class DoctorDetailsLoading extends DoctorDetailsState {}

final class DoctorDetailsSuccess extends DoctorDetailsState {
  final DoctorModel doctorModel;
  DoctorDetailsSuccess({required this.doctorModel});
}

final class DoctorDetailsFailure extends DoctorDetailsState {
  final ApiErrorModel apiErrorModel;
  DoctorDetailsFailure({required this.apiErrorModel});
}
