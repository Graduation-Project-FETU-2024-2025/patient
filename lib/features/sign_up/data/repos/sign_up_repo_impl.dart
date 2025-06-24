import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_consumer.dart';
import 'package:patient_app/core/database/api/api_error_handler.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/core/database/api/end_points.dart';
import 'package:patient_app/core/functions/upload_image_to_api.dart';
import 'package:patient_app/features/sign_up/data/models/sign_up_request_model.dart';
import 'package:patient_app/features/sign_up/data/repos/sign_up_repo.dart';

class SignUpRepoImpl implements SignUpRepo {
  final ApiConsumer apiConsumer;

  SignUpRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, String>> register(
      {required SignUpRequestModel signUpModel}) async {
    try {
      final Map<String, dynamic> formData = signUpModel.toJson();
      formData['image'] = await uploadImageToAPI(signUpModel.image);
      final response = await apiConsumer.post(
        EndPoints.register,
        data: formData,
        isFormData: true,
      );
      return Right(response.data['message']);
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
