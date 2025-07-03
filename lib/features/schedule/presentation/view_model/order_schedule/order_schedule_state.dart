part of 'order_schedule_cubit.dart';

@immutable
sealed class OrderScheduleState {}

final class OrderScheduleInitial extends OrderScheduleState {}

final class OrderScheduleLoading extends OrderScheduleState {}

final class OrderScheduleSuccess extends OrderScheduleState {
  final List<AppointmentModel> orders;
  final DateTime selectedDate;

  OrderScheduleSuccess(this.selectedDate, {required this.orders});
}

final class OrderScheduleFailure extends OrderScheduleState {
  final String message;

  OrderScheduleFailure({required this.message});
}
