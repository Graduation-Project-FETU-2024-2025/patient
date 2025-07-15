import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:patient_app/core/database/api/api_consumer.dart';
import 'package:patient_app/core/database/api/api_error_handler.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/core/database/api/end_points.dart';
import 'package:patient_app/features/cart/data/models/make_order_request_model.dart';
import 'package:patient_app/features/cart/data/repository/checkout_repo.dart';

class CheckoutRepoImpl implements CheckoutRepo {
  final ApiConsumer _apiConsumer;

  CheckoutRepoImpl(this._apiConsumer);
  @override
  Future<Either<ApiErrorModel, String>> makeOrder(
      {required MakeOrderRequestModel orderRequest}) async {
    try {
      final Response response = await _apiConsumer.post(
        EndPoints.createOrder,
        data: orderRequest.toJson(),
      );
      if (response.statusCode == 201) {
        return const Right('Order created successfully');
      } else {
        return Left(ApiErrorModel(message: response.data['message']));
      }
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}