import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/orders/data/models/make_order_request_model.dart';
import 'package:patient_app/features/orders/data/models/medicine_model.dart';

abstract class OrderMedicineRepo {
  Future<Either<ApiErrorModel, List<MedicineModel>>> searchMedicine(
      String query);

  Future<Either<ApiErrorModel, String>> makeOrder({required MakeOrderRequestModel orderRequest});
}
