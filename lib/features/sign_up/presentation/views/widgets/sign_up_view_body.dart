import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/core/widgets/custom_button.dart';
import 'package:patient_app/core/widgets/custom_loading_widget.dart';
import 'package:patient_app/core/widgets/toast.dart';
import 'package:patient_app/features/sign_up/presentation/view_models/sign_up/sign_up_cubit.dart';
import 'package:patient_app/features/sign_up/presentation/views/widgets/already_have_account.dart';
import 'package:patient_app/features/sign_up/presentation/views/widgets/sign_up_form.dart';
import 'package:patient_app/generated/l10n.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        children: [
          Gap(20.h),
          Text(
            S.of(context).register,
            style: AppStyles.medium30(context).copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          Gap(5.h),
          Text(
            S.of(context).createYourNewAccount,
            style: AppStyles.medium16(context).copyWith(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.black.withValues(alpha: 0.3)
                  : AppColors.white.withValues(alpha: 0.3),
            ),
          ),
          Gap(20.h),
          const SignUpForm(),
          Gap(20.h),
          BlocConsumer<SignUpCubit, SignUpState>(
            listener: (context, state) {
              if (state is SignUpSuccess) {
                errorToast(message: state.successMessage);
                Navigator.pop(context);
              }
              if (state is SignUpFailure) {
                errorToast(
                    message: state.errorModel.message ?? 'An error occurred');
              }
            },
            builder: (context, state) {
              return state is SignUpLoading
                  ? const CustomLoadingWidget()
                  : CustomButton(
                      onPressed: () {
                        context.read<SignUpCubit>().register();
                      },
                      text: S.of(context).signup,
                    );
            },
          ),
          Gap(15.h),
          const AlreadyHaveAccount(),
          Gap(20.h),
        ],
      ),
    );
  }
}
