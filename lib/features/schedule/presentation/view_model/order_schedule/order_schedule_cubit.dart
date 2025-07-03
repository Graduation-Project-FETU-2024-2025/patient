import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/models/appointment_model.dart';
import '../../../data/repo/appointment_repo.dart';

part 'order_schedule_state.dart';

class OrderScheduleCubit extends Cubit<OrderScheduleState> {
  OrderScheduleCubit(this.repo) : super(OrderScheduleInitial());
  final AppointmentRepo repo;

  List<AppointmentModel> _allAppointments = [];
  DateTime _selectedDate = DateTime.now();

  void fetchAppointments() async {
    emit(OrderScheduleLoading());
    final result = await repo.getOrders();
    result.fold(
      (failure) => emit(OrderScheduleFailure(message: failure.message!)),
      (orders) {
        _allAppointments = orders;
        emit(OrderScheduleSuccess(
          orders: _filterAppointmentsByDate(_selectedDate),
          _selectedDate,
        ));
      },
    );
  }

  void changeSelectedDate(DateTime newDate) {
    _selectedDate = newDate;
    emit(OrderScheduleSuccess(
      orders: _filterAppointmentsByDate(newDate),
      newDate,
    ));
  }

  List<AppointmentModel> _filterAppointmentsByDate(DateTime date) {
    return _allAppointments.where((appointment) {
      final appointmentDate = appointment.date;
      return appointmentDate.year == date.year &&
          appointmentDate.month == date.month &&
          appointmentDate.day == date.day;
    }).toList();
  }
}
