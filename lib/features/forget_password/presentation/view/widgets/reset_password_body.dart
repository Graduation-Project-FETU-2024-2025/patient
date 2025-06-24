import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_images.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/features/forget_password/presentation/view/widgets/change_password_button_bloc_consumer.dart';
import 'package:patient_app/features/forget_password/presentation/view/widgets/reset_password_form.dart';
import 'package:patient_app/generated/l10n.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppImages.imagesResetPassword),
          Text(
            S.of(context).resetPassword,
            style: AppStyles.medium30(context)
                .copyWith(color: AppColors.primaryColor),
          ),
          Gap(10.h),
          Text(
            S.of(context).enterNewPassword,
            textAlign: TextAlign.center,
            style: AppStyles.medium16(context).copyWith(
              color: AppColors.black.withValues(alpha: .3),
            ),
          ),
          Gap(20.h),
          const ResetPasswordForm(),
          Gap(20.h),
          ChangePasswordButtonBlocConsumer(email: email,),
        ],
      ),
    );
  }
}


