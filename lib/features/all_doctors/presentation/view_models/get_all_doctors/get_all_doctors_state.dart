part of 'get_all_doctors_cubit.dart';

@immutable
sealed class GetAllDoctorsState {}

final class GetAllDoctorsInitial extends GetAllDoctorsState {}

final class GetAllDoctorsLoading extends GetAllDoctorsState {}

final class GetAllDoctorsSucess extends GetAllDoctorsState {
  final List<DoctorModel> doctors;

  GetAllDoctorsSucess({required this.doctors});
}

final class GetAllDoctorsFailure extends GetAllDoctorsState {
  final ApiErrorModel apiErrorModel;

  GetAllDoctorsFailure({required this.apiErrorModel});
}
