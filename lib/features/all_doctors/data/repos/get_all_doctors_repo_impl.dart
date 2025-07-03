import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_consumer.dart';
import 'package:patient_app/core/database/api/api_error_handler.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/core/database/api/end_points.dart';
import 'package:patient_app/features/all_doctors/data/models/get_all_doctors_response.dart';
import 'package:patient_app/features/all_doctors/data/repos/get_all_doctors_repo.dart';

class GetAllDoctorsRepoImpl implements GetAllDoctorsRepo {
  final ApiConsumer apiConsumer;

  GetAllDoctorsRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, GetAllDoctorsResponse>> getAllDoctors(
      {required String specialityId}) async {
    try {
      final response = await apiConsumer.get(
        "${EndPoints.getDoctorsbySpeciality}/$specialityId",
        queryParameter: {
          "page": 1,
          "pageSize": 10,
        },
      );
      final data = GetAllDoctorsResponse.fromJson(response.data);
      return Right(data);
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
