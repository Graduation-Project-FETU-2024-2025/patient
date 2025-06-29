import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/all_doctors/data/models/get_all_doctors_response.dart';

abstract class GetAllDoctorsRepo {
  Future<Either<ApiErrorModel, GetAllDoctorsResponse>> getAllDoctors(
      {required String specialityId});
}
