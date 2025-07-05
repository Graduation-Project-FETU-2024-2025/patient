import 'package:dartz/dartz.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:patient_app/core/database/api/api_consumer.dart';
import 'package:patient_app/core/database/api/api_error_handler.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/core/database/api/end_points.dart';
import 'package:patient_app/core/database/cache/cache_keys.dart';
import 'package:patient_app/core/database/cache/cashe_helper.dart';
import 'package:patient_app/core/database/cache/secure_storage.dart';
import 'package:patient_app/core/services/get_it.dart';
import 'package:patient_app/features/sign_in/data/models/sign_in_request_model.dart';
import 'package:patient_app/features/sign_in/data/models/sign_in_response_model.dart';
import 'package:patient_app/features/sign_in/data/repository/sign_in_repo.dart';

class SignInRepoImpl implements SignInRepo {
  final ApiConsumer apiConsumer;

  SignInRepoImpl(this.apiConsumer);

  @override
  Future<Either<ApiErrorModel, void>> signIn(
      {required SignInRequestModel signInRequestModel}) async {
    try {
      final response = await apiConsumer.post(EndPoints.login,
          data: signInRequestModel.toJson());
      final signInResponse = SignInResponseModel.fromJson(response.data);
      if (response.statusCode == 200) {
        await _cacheTokenAndId(signInResponse.token);
        return const Right(null);
      } else {
        return Left(ApiErrorModel(
          statusCode: response.statusCode,
          message: response.data['message'] ?? 'An error occurred',
        ));
      }
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }

  Future _cacheTokenAndId(String token) async {
    await SecureStorage.instance.addData(key: CacheKeys.token, data: token);
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    await SecureStorage.instance
        .addData(key: CacheKeys.id, data: payload['sub']);
    await getIt<CacheHelper>()
        .saveData(key: CacheKeys.profileImage, value: payload['Image']);
    await getIt<CacheHelper>()
        .saveData(key: CacheKeys.username, value: payload['User Name']);
    await getIt<CacheHelper>()
        .saveData(key: CacheKeys.email, value: payload['email']);
  }
}
