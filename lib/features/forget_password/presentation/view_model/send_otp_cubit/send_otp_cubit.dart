import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/features/forget_password/data/repository/forget_password_repo.dart';
import 'package:patient_app/features/forget_password/presentation/view_model/send_otp_cubit/send_otp_state.dart';

class SendOtpCubit extends Cubit<SendOtpState> {
  SendOtpCubit(this._forgetPasswordRepo) : super(SendOtpInitial());
  final ForgetPasswordRepo _forgetPasswordRepo;
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void sendOtp() async {
    emit(SendOtpLoading());
    final result = await _forgetPasswordRepo.getOTP(emailController.text);
    result.fold(
      (apiErrorModel) => emit(SendOtpFailure(apiErrorModel: apiErrorModel)),
      (message) => emit(SendOtpSuccess(message)),
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
