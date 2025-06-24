import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/forget_password/data/models/reset_password_request_model.dart';

abstract class ForgetPasswordRepo {
  Future<Either<ApiErrorModel, String>> getOTP(String email);

  Future<Either<ApiErrorModel, String>> verifyOTP(String email, String otp);

  Future<Either<ApiErrorModel, String>> resendOTP();

  Future<Either<ApiErrorModel, String>> resetPassword(
      ResetPasswordRequestModel resetPasswordRequestModel);
}
