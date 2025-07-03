import 'dart:developer';

import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
import '../../../../core/database/api/api_consumer.dart';
import '../../../../core/database/api/api_error_handler.dart';
import '../../../../core/database/api/api_error_model.dart';
import '../../../../core/database/api/end_points.dart';
import '../../../../core/database/cache/cache_keys.dart';
import '../../../../core/database/cache/secure_storage.dart';
import '../models/appointment_model.dart';
import 'appointment_repo.dart';

class AppointmentRepoImpl implements AppointmentRepo {
  final ApiConsumer api;
  AppointmentRepoImpl(this.api);

  @override
  Future<Either<ApiErrorModel, List<AppointmentModel>>> getOrders() async {
    final clinicId = await SecureStorage.instance.getData(key: CacheKeys.id);
    log('user id $clinicId');
    try {
      final response = await api.get(
          '${EndPoints.getAppointments}efd12de3-9c39-49f5-8e52-530bcede1868');

      if (response.data['data'] is List) {
        final List<AppointmentModel> appointments =
            (response.data['data'] as List)
                .map((item) => AppointmentModel.fromJson(item))
                .toList();

        return Right(appointments);
      } else {
        return const Right([]);
      }
    } catch (error) {
      return Left(ApiErrorHandler.handleError(error));
    }
  }
}
