import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_images.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/features/forget_password/presentation/view/widgets/havent_recive_otp.dart';
import 'package:patient_app/features/forget_password/presentation/view/widgets/otp_digits_section.dart';
import 'package:patient_app/features/forget_password/presentation/view/widgets/verify_otp_button_bloc_consumer.dart';
import 'package:patient_app/generated/l10n.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0.w),
      child: Column(
        children: [
          Image.asset(AppImages.imagesResetPassword),
          Text(
            S.of(context).enterOTP,
            style: AppStyles.medium30(context)
                .copyWith(color: AppColors.primaryColor),
          ),
          Gap(10.h),
          Text(
            S.of(context).enterOTPSentTo,
            style: AppStyles.medium16(context).copyWith(
              color: AppColors.black.withValues(alpha: .3),
            ),
          ),
          Text(
            email,
            style: AppStyles.medium16(context)
                .copyWith(color: AppColors.primaryColor),
          ),
          Gap(20.h),
          const OTPDigitsSection(),
          Gap(20.h),
           VerifyOTPButtonBlocConsumer(email: email,),
          Gap(20.h),
          const HaventReciveOTP(),
        ],
      ),
    );
  }
}

