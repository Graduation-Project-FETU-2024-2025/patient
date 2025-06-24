import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_images.dart';
import 'package:patient_app/core/widgets/custom_text_form_field.dart';
import 'package:patient_app/features/forget_password/presentation/view_model/reset_password_cubit/reset_password_cubit.dart';
import 'package:patient_app/generated/l10n.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ResetPasswordCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller:
                context.read<ResetPasswordCubit>().newPasswordController,
            hintText: S.of(context).newPassword,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                AppImages.imagesPassword,
                height: 28.h,
              ),
            ),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Image.asset(
                AppImages.imagesUnvisable,
                height: 28.h,
              ),
            ),
          ),
          Gap(20.h),
          CustomTextFormField(
            controller:
                context.read<ResetPasswordCubit>().confirmPasswordController,
            hintText: S.of(context).confirmPassword,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                AppImages.imagesPassword,
                height: 28.h,
              ),
            ),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Image.asset(
                AppImages.imagesUnvisable,
                height: 28.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
