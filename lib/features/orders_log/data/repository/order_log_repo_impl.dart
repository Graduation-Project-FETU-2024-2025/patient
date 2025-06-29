import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/orders_log/data/models/order_model.dart';
import 'package:patient_app/features/orders_log/data/repository/order_log_repo.dart';

class OrderLogRepoImpl implements OrderLogRepo {
  @override
  Future<Either<ApiErrorModel, List<OrderModel>>> getOrders() {
    // TODO: implement getOrders
    throw UnimplementedError();
  }
}