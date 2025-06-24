import 'package:patient_app/core/database/api/api_error_model.dart';

sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordLoading extends ResetPasswordState {}

final class ResetPasswordSuccess extends ResetPasswordState {
  final String message;

  ResetPasswordSuccess(this.message);
}

final class ResetPasswordFailure extends ResetPasswordState {
  final ApiErrorModel apiErrorModel;

  ResetPasswordFailure({required this.apiErrorModel});
}
