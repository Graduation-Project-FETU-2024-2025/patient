import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/helpers/extentions.dart';
import 'package:patient_app/core/routers/routing.dart';
import 'package:patient_app/core/widgets/custom_button.dart';
import 'package:patient_app/core/widgets/custom_loading_widget.dart';
import 'package:patient_app/core/widgets/toast.dart';
import 'package:patient_app/features/forget_password/presentation/view_model/reset_password_cubit/reset_password_cubit.dart';
import 'package:patient_app/features/forget_password/presentation/view_model/reset_password_cubit/reset_password_state.dart';
import 'package:patient_app/generated/l10n.dart';

class ChangePasswordButtonBlocConsumer extends StatelessWidget {
  const ChangePasswordButtonBlocConsumer({
    super.key,
    required this.email,
  });
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          successToast(message: S.of(context).passwordResetSuccess);
          context.pushNamedAndRemoveUntil(Routing.signIn,
              predicate: (predicted) => false);


        } else if (state is ResetPasswordFailure) {
          errorToast(
              message: state.apiErrorModel.message ??
                  S.of(context).someThingWentWrong);
        }
      },
      builder: (context, state) {
        return state is ResetPasswordLoading
            ? const CustomLoadingWidget()
            : CustomButton(
                onPressed: () {
                  if (context
                      .read<ResetPasswordCubit>()
                      .formKey
                      .currentState!
                      .validate()) {
                    context.read<ResetPasswordCubit>().resetPassword(email);
                  }
                },
                text: S.of(context).resetPassword,
              );
      },
    );
  }
}
