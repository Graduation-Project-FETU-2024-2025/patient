import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/orders_log/data/models/order_model.dart';

abstract class OrderLogRepo {
  Future<Either<ApiErrorModel, List<OrderModel>>> getOrders();
  Future<Either<ApiErrorModel, String>> deleteOrder(String orderId);
}
