import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_consumer.dart';
import 'package:patient_app/core/database/api/api_error_handler.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/core/database/api/end_points.dart';
import 'package:patient_app/features/doctor_details/data/models/get_doctor_details_response_model.dart';
import 'package:patient_app/features/doctor_details/data/repos/get_details_doctor_repo.dart';

class GetDetailsDoctorRepoImpl implements GetDetailsDoctorRepo {
  final ApiConsumer apiConsumer;

  GetDetailsDoctorRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, GetDoctorDetailsResponseModel>> getDetailsDoctor(
      {required String id}) async {
    try {
      final response =
          await apiConsumer.get('${EndPoints.getDoctorDetails}/$id');
      final data = GetDoctorDetailsResponseModel.fromJson(response.data);
      return right(data);
    } catch (e) {
      return left(ApiErrorHandler.handleError(e));
    }
  }
}
