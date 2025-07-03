import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_consumer.dart';
import 'package:patient_app/core/database/api/api_error_handler.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/core/database/api/end_points.dart';
import 'package:patient_app/features/home/data/models/get_specialities_response.dart';
import 'package:patient_app/features/home/data/repos/get_specialites_repo.dart';

class GetSpecialitiesRepoImpl implements GetSpecialitesRepo {
  final ApiConsumer apiConsumer;

  GetSpecialitiesRepoImpl({required this.apiConsumer});

  @override
  Future<Either<ApiErrorModel, GetSpecialitiesResponse>>
      getSpecialities() async {
    try {
      final response = await apiConsumer.get(
        EndPoints.getSpecialities,
        queryParameter: {
          "page": 1,
          "pageSize": 10,
        },
      );
      final data = GetSpecialitiesResponse.fromJson(response.data);
      return Right(data);
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
