import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/home/data/models/get_top_rated_doctors_response.dart';

abstract class GetTopDoctorsRepo {
  Future<Either<ApiErrorModel, GetTopRatedDoctorsResponse>> getTopDoctors();
}
