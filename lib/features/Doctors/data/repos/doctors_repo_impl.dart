import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_consumer.dart';
import 'package:patient_app/core/database/api/api_error_handler.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/core/database/api/end_points.dart';
import 'package:patient_app/features/Doctors/data/repos/doctors_repo.dart';
import 'package:patient_app/features/all_doctors/data/models/get_all_doctors_response.dart';

class DoctorsRepoImpl implements DoctorsRepo {
  final ApiConsumer apiConsumer;

  DoctorsRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, GetAllDoctorsResponse>> getDoctors() async {
    try {
      final response = await apiConsumer.get(
        EndPoints.getAllDoctors,
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
