import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/helpers/extentions.dart';
import 'package:patient_app/core/routers/routing.dart';
import 'package:patient_app/core/widgets/custom_button.dart';
import 'package:patient_app/core/widgets/custom_loading_widget.dart';
import 'package:patient_app/core/widgets/toast.dart';
import 'package:patient_app/features/forget_password/presentation/view_model/send_otp_cubit/send_otp_cubit.dart';
import 'package:patient_app/features/forget_password/presentation/view_model/send_otp_cubit/send_otp_state.dart';
import 'package:patient_app/generated/l10n.dart';

class SendOTPButtonBlocConsumer extends StatelessWidget {
  const SendOTPButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendOtpCubit, SendOtpState>(
      listener: (context, state) {
        if (state is SendOtpSuccess) {
          context.pushNamed(
            Routing.forgetPassword,
            argument: context.read<SendOtpCubit>().emailController.text,
          );
        } else if (state is SendOtpFailure) {
          errorToast(message: state.apiErrorModel.message?? S.of(context).someThingWentWrong);
        }
      },
      builder: (context, state) {
        return state is SendOtpLoading? const CustomLoadingWidget() :CustomButton(
            onPressed: () {
              if (context
                  .read<SendOtpCubit>()
                  .formKey
                  .currentState!
                  .validate()) {
                context.read<SendOtpCubit>().sendOtp();
              }
            },
            text: S.of(context).next);
      },
    );
  }
}
