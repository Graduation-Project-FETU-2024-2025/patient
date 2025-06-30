import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/doctor_details/data/models/get_doctor_details_response_model.dart';

abstract class GetDetailsDoctorRepo {
  Future<Either<ApiErrorModel, GetDoctorDetailsResponseModel>> getDetailsDoctor(
      {required String id});
}
