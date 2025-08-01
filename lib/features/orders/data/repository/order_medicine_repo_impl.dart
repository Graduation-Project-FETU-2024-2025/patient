import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_consumer.dart';
import 'package:patient_app/core/database/api/api_error_handler.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/core/database/api/end_points.dart';
import 'package:patient_app/core/models/medicine_model.dart';
import 'package:patient_app/features/orders/data/repository/order_medicine_repo.dart';

class OrderMedicineRepoImpl implements OrderMedicineRepo {
  final ApiConsumer _apiConsumer;

  OrderMedicineRepoImpl(this._apiConsumer);


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
