import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_images.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/core/widgets/custom_text_form_field.dart';
import 'package:patient_app/features/forget_password/presentation/view/widgets/send_otp_button_bloc_consumer.dart';
import 'package:patient_app/features/forget_password/presentation/view_model/send_otp_cubit/send_otp_cubit.dart';
import 'package:patient_app/generated/l10n.dart';

class SendEmailBody extends StatelessWidget {
  const SendEmailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0.w),
      child: Column(
        children: [
          Image.asset(AppImages.imagesResetPassword),
          Gap(20.h),
          Text(
            S.of(context).enterYourEmail,
            style: AppStyles.medium30(context).copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          Gap(20.h),
          Form(
            key: context.read<SendOtpCubit>().formKey,
            child: CustomTextFormField(
              controller: context.read<SendOtpCubit>().emailController,
              hintText: S.of(context).email,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                child: Image.asset(
                  AppImages.imagesEmail,
                  height: 10.h,
                ),
              ),
            ),
          ),
          Gap(40.h),
          const SendOTPButtonBlocConsumer(),
        ],
      ),
    );
  }
}

