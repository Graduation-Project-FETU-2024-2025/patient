part of 'make_appointment_cubit.dart';

@immutable
sealed class MakeAppointmentState {}

final class MakeAppointmentInitial extends MakeAppointmentState {}

final class MakeAppointmentLoading extends MakeAppointmentState {}

final class MakeAppointmentSuccess extends MakeAppointmentState {}

final class MakeAppointmentFailure extends MakeAppointmentState {
  final ApiErrorModel apiErrorModel;

  MakeAppointmentFailure({required this.apiErrorModel});
}

final class MakeAppointmentChangeDate extends MakeAppointmentState {}

final class MakeAppointmentPickFile extends MakeAppointmentState {}

final class MakeAppointmentRemoveFile extends MakeAppointmentState {}

final class MakeAppointmentTimeSlotSelected extends MakeAppointmentState {
  final String selectedTime;
  MakeAppointmentTimeSlotSelected(this.selectedTime);
}
