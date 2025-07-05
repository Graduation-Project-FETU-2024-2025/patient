import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:patient_app/core/database/api/api_consumer.dart';
import 'package:patient_app/core/database/api/api_error_handler.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/core/database/api/end_points.dart';
import 'package:patient_app/features/orders/data/models/make_order_request_model.dart';
import 'package:patient_app/features/orders/data/models/medicine_model.dart';
import 'package:patient_app/features/orders/data/repository/order_medicine_repo.dart';

class OrderMedicineRepoImpl implements OrderMedicineRepo {
  final ApiConsumer _apiConsumer;

  OrderMedicineRepoImpl(this._apiConsumer);
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

  @override
  Future<Either<ApiErrorModel, List<MedicineModel>>> searchMedicine(
      String query) async {
    try {
      final response = await _apiConsumer.get(EndPoints.searchMedicine(query));

      return Right(
        (response.data['data'] as List)
            .map(
              (medicine) => MedicineModel.fromJson(medicine),
            )
            .toList(),
      );
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
