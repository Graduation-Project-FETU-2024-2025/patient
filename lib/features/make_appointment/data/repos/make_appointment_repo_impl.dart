import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_consumer.dart';
import 'package:patient_app/core/database/api/api_error_handler.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/core/database/api/end_points.dart';
import 'package:patient_app/features/make_appointment/data/models/make_appointment_request.dart';
import 'package:patient_app/features/make_appointment/data/repos/make_appointment_repo.dart';

class MakeAppointmentRepoImpl implements MakeAppointmentRepo {
  final ApiConsumer apiConsumer;

  MakeAppointmentRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, String>> makeAppointment(
      {required MakeAppointmentRequest makeAppointmentRequest}) async {
    try {
      final formData = await makeAppointmentRequest.toFormData();
      final response = await apiConsumer.post(
        EndPoints.makeAppointment,
        data: formData,
      );
      return right(response.data['message']);
    } catch (e) {
      return left(
        ApiErrorHandler.handleError(e),
      );
    }
  }
}
