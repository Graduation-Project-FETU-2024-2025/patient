import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_consumer.dart';
import 'package:patient_app/core/database/api/api_error_handler.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/core/database/api/end_points.dart';
import 'package:patient_app/features/home/data/models/get_top_rated_doctors_response.dart';
import 'package:patient_app/features/home/data/repos/get_top_doctors_repo.dart';

class GetTopDoctorsRepoImpl implements GetTopDoctorsRepo {
  final ApiConsumer apiConsumer;

  GetTopDoctorsRepoImpl({required this.apiConsumer});

  @override
  Future<Either<ApiErrorModel, GetTopRatedDoctorsResponse>>
      getTopDoctors() async {
    try {
      final response =
          await apiConsumer.get(EndPoints.getTopDoctors, queryParameter: {
        "page": 1,
        "pageSize": 10,
      });
      final data = GetTopRatedDoctorsResponse.fromJson(response.data);
      return Right(data);
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
