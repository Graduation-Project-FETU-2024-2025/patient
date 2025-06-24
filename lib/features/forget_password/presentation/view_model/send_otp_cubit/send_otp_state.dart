import 'package:patient_app/core/database/api/api_error_model.dart';

sealed class SendOtpState {}

final class SendOtpInitial extends SendOtpState {}

final class SendOtpLoading extends SendOtpState {}

final class SendOtpSuccess extends SendOtpState {
  final String message;

  SendOtpSuccess(this.message);
}

final class SendOtpFailure extends SendOtpState {
  final ApiErrorModel apiErrorModel;

  SendOtpFailure({required this.apiErrorModel});
}
