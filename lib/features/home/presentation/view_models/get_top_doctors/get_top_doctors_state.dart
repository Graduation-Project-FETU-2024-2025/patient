part of 'get_top_doctors_cubit.dart';

@immutable
sealed class GetTopDoctorsState {}

final class GetTopDoctorsInitial extends GetTopDoctorsState {}

final class GetTopDoctorsLoading extends GetTopDoctorsState {}

final class GetTopDoctorsSuccess extends GetTopDoctorsState {
  final List<DoctorModel> topDoctors;
  GetTopDoctorsSuccess({required this.topDoctors});
}

final class GetTopDoctorsFailure extends GetTopDoctorsState {
  final ApiErrorModel errorModel;
  GetTopDoctorsFailure({required this.errorModel});
}
