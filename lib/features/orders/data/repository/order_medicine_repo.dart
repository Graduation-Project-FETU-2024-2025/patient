import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/orders/data/models/medicine_model.dart';

abstract class OrderMedicineRepo {
  Future<Either<ApiErrorModel, List<MedicineModel>>> searchMedicine(
      String query);
}
