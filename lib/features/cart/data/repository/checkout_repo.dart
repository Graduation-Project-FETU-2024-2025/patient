import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/cart/data/models/make_order_request_model.dart';

abstract class CheckoutRepo {
  Future<Either<ApiErrorModel, String>> makeOrder(
      {required MakeOrderRequestModel orderRequest});
}
