import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/home/data/models/get_specialities_response.dart';

abstract class GetSpecialitesRepo {
  Future<Either<ApiErrorModel, GetSpecialitiesResponse>> getSpecialities();
}
