import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/features/orders_log/data/repository/order_log_repo.dart';
import 'package:patient_app/features/orders_log/presentation/view_model/cubit/order_log_state.dart';

class OrderLogCubit extends Cubit<OrderLogState> {
  OrderLogCubit(this._orderLogRepo) : super(OrderLogInitial());

  final OrderLogRepo _orderLogRepo;

  void getOrders() async {
    emit(OrderLogLoading());
    final result = await _orderLogRepo.getOrders();
    result.fold(
      (error) => emit(OrderLogError(error)),
      (orders) => emit(OrderLogLoaded(orders)),
    );
  }


  void deleteOrder(String orderId) async {
    emit(OrderLogDeleting());
    final result = await _orderLogRepo.deleteOrder(orderId);
    result.fold(
      (error) => emit(OrderLogDeletedFailure(errorModel: error)),
      (message) => emit(OrderLogDeleted(message)),
    );
  }

}
