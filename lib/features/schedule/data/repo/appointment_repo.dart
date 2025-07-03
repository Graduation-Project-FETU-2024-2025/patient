import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';

import '../models/appointment_model.dart';

abstract class AppointmentRepo {
  Future<Either<ApiErrorModel, List<AppointmentModel>>> getOrders();
}
