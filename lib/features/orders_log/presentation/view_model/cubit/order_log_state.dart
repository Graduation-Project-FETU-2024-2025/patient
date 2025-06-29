
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/orders_log/data/models/order_model.dart';

sealed class OrderLogState {}

final class OrderLogInitial extends OrderLogState {}


final class OrderLogLoading extends OrderLogState {}

final class OrderLogLoaded extends OrderLogState {
  final List<OrderModel> orders;

  OrderLogLoaded(this.orders);
}

final class OrderLogError extends OrderLogState {
  final ApiErrorModel error;

  OrderLogError(this.error);
}
