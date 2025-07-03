import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:patient_app/core/database/api/api_consumer.dart';
import 'package:patient_app/core/database/api/api_error_handler.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/core/database/api/end_points.dart';
import 'package:patient_app/features/orders_log/data/models/order_model.dart';
import 'package:patient_app/features/orders_log/data/repository/order_log_repo.dart';

class OrderLogRepoImpl implements OrderLogRepo {
  final ApiConsumer _apiConsumer;
  OrderLogRepoImpl(this._apiConsumer);
  @override
  Future<Either<ApiErrorModel, List<OrderModel>>> getOrders() async {
    try {
      final Response response =
          await _apiConsumer.get(EndPoints.orderLogs, queryParameter: {
        'pagesize': 5,
        'pageindex': 1,
      });
      if (response.data['data'].isEmpty) {
        return const Right([]);
      }
      List<OrderModel> orders = [];
      for (var order in response.data['data']) {
        String orderStatus = order['status'];
        final orderList = order['orderItems'];
        if (orderList.isEmpty) {
          continue;
        } else {
          for (var item in orderList) {
            orders.add(OrderModel.fromJson(item).copyWith(status: orderStatus));
          }
        }
      }
      log('Orders: ${orders.length}');
      return Right(orders);
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<ApiErrorModel, String>> deleteOrder(String orderId) async {
    try {
      final response =
          await _apiConsumer.delete(EndPoints.deleteOrderLogs(orderId));

      if (response.statusCode == 200) {
        return Right(response.data['message']);
      } else {
        return Left(ApiErrorModel(
          statusCode: response.statusCode,
          message: response.data['message'] ?? 'Unknown error occurred',
        ));
      }
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
