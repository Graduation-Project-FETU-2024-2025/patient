import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_consumer.dart';
import 'package:patient_app/core/database/api/api_error_handler.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/core/database/api/end_points.dart';
import 'package:patient_app/core/database/cache/cache_keys.dart';
import 'package:patient_app/core/database/cache/secure_storage.dart';
import 'package:patient_app/features/forget_password/data/models/reset_password_request_model.dart';
import 'package:patient_app/features/forget_password/data/repository/forget_password_repo.dart';

class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  final ApiConsumer _apiConsumer;

  ForgetPasswordRepoImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<Either<ApiErrorModel, String>> getOTP(String email) async {
    try {
      final response =
          await _apiConsumer.post(EndPoints.getOtp, data: {'email': email});

      return Right(response.data['message'] as String);
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<ApiErrorModel, String>> resendOTP() {
    // TODO: implement resendOTP
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiErrorModel, String>> resetPassword(
      ResetPasswordRequestModel resetPasswordRequestModel) async{
    try {
      final response = await _apiConsumer.post(
        EndPoints.resetPassword,
        data: resetPasswordRequestModel.toJson(),
      );
      if (response.statusCode == 200) {
        final data = response.data['message'] as String;
        return Right(data);
      } else {
        return Left(ApiErrorModel(
          message: 'Failed to reset password',
          statusCode: response.statusCode,
        ));
      }
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
      
    }
  }

  @override
  Future<Either<ApiErrorModel, String>> verifyOTP(
      String email, String otp) async {
    try {
      final response = await _apiConsumer.post(EndPoints.verifyOtp, data: {
        'otp': otp,
        'email': email,
      });
      if (response.statusCode == 200) {
        final data = response.data['resetToken'] as String;
       await SecureStorage.instance.addData(key: CacheKeys.resetToken, data: data);
        return const Right('Successfully verified OTP');
      } else {
        return Left(ApiErrorModel(
          message: 'Failed to verify OTP',
          statusCode: response.statusCode,
        ));
      }
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
