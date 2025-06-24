import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/sign_up/data/models/sign_up_request_model.dart';

abstract class SignUpRepo {
  Future<Either<ApiErrorModel, String>> register(
      {required SignUpRequestModel signUpModel});
}
