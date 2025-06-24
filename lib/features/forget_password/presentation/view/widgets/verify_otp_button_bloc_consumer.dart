import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/helpers/extentions.dart';
import 'package:patient_app/core/routers/routing.dart';
import 'package:patient_app/core/widgets/custom_button.dart';
import 'package:patient_app/core/widgets/custom_loading_widget.dart';
import 'package:patient_app/core/widgets/toast.dart';
import 'package:patient_app/features/forget_password/presentation/view_model/otp_cubit/otp_cubit.dart';
import 'package:patient_app/features/forget_password/presentation/view_model/otp_cubit/otp_state.dart';
import 'package:patient_app/generated/l10n.dart';

class VerifyOTPButtonBlocConsumer extends StatelessWidget {
  const VerifyOTPButtonBlocConsumer({
    super.key,
    required this.email,
  });
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpCubit, OtpState>(
      listener: (context, state) {
        if (state is OtpCheckSuccess) {
          context.pushNamed(
            Routing.restPassword,
            argument: email,
          );
        } else if (state is OtpCheckFailure) {
          errorToast(
              message: state.apiErrorModel.message ??
                  S.of(context).someThingWentWrong);
        }
      },
      builder: (context, state) {
        return state is OtpCheckLoading
            ? const CustomLoadingWidget()
            : CustomButton(
                onPressed: () {
                  if (context
                      .read<OtpCubit>()
                      .otpFormKey
                      .currentState!
                      .validate()) {
                    context.read<OtpCubit>().submitOtp(email);
                  }
                },
                text: S.of(context).next);
      },
    );
  }
}
