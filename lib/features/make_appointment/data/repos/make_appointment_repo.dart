import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/make_appointment/data/models/make_appointment_request.dart';

abstract class MakeAppointmentRepo {
  Future<Either<ApiErrorModel, String>> makeAppointment(
      {required MakeAppointmentRequest makeAppointmentRequest});
}
