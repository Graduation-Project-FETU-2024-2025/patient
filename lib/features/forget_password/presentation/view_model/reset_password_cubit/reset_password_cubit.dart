import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/database/cache/cache_keys.dart';
import 'package:patient_app/core/database/cache/secure_storage.dart';
import 'package:patient_app/features/forget_password/data/models/reset_password_request_model.dart';
import 'package:patient_app/features/forget_password/data/repository/forget_password_repo.dart';
import 'package:patient_app/features/forget_password/presentation/view_model/reset_password_cubit/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this._forgetPasswordRepo) : super(ResetPasswordInitial());
  final ForgetPasswordRepo _forgetPasswordRepo;

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void resetPassword(String email) async {
    emit(ResetPasswordLoading());
    final token =
        await SecureStorage.instance.getData(key: CacheKeys.resetToken);
    log(token.toString());
    final result = await _forgetPasswordRepo.resetPassword(
      ResetPasswordRequestModel(
          email: email,
          newPassword: newPasswordController.text,
          confirmPassword: confirmPasswordController.text,
          token: token!),
    );

    result.fold(
      (failure) => emit(ResetPasswordFailure(apiErrorModel: failure)),
      (success) {
        SecureStorage.instance.deleteData(key: CacheKeys.resetToken);
        emit(ResetPasswordSuccess(success));
      },
    );
  }

  @override
  Future<void> close() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
