import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_icons.dart';
import 'package:patient_app/core/utils/app_images.dart';
import 'package:patient_app/core/widgets/custom_text_form_field.dart';
import 'package:patient_app/features/sign_up/presentation/view_models/sign_up/sign_up_cubit.dart';
import 'package:patient_app/features/sign_up/presentation/views/widgets/date_form_field.dart';
import 'package:patient_app/features/sign_up/presentation/views/widgets/gender_selected_menu.dart';
import 'package:patient_app/generated/l10n.dart';

import '../../../../../core/utils/app_colors.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return Form(
      key: cubit.formkey,
      child: Column(
        children: [
          BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => cubit.pickImageFromGallery(),
                child: CircleAvatar(
                  backgroundColor: AppColors.gray,
                  radius: 45.r,
                  backgroundImage: cubit.pickedImage != null
                      ? FileImage(
                          File(
                            cubit.pickedImage!.path,
                          ),
                        )
                      : null,
                  child: cubit.pickedImage != null
                      ? null
                      : SvgPicture.asset(
                          AppIcons.svgsCamera,
                          width: 30.w,
                          height: 30.h,
                        ),
                ),
              );
            },
          ),
          Gap(20.h),
          CustomTextFormField(
            controller: cubit.emailController,
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
          Gap(20.h),
          CustomTextFormField(
            controller: cubit.nameController,
            hintText: S.of(context).name,
            keyboardType: TextInputType.name,
            prefixIcon: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              child: Image.asset(
                AppImages.imagesProfile,
                height: 10.h,
              ),
            ),
          ),
          Gap(20.h),
          CustomTextFormField(
            controller: cubit.passwordController,
            hintText: S.of(context).password,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              child: Image.asset(
                AppImages.imagesPassword,
                height: 10.h,
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
          // CustomTextFormField(
          //   controller: cubit.idController,
          //   hintText: S.of(context).id,
          //   keyboardType: TextInputType.number,
          //   prefixIcon: Padding(
          //     padding:
          //         const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          //     child: Image.asset(
          //       AppImages.imagesId,
          //       height: 10.h,
          //     ),
          //   ),
          // ),
          // Gap(20.h),
          const DateFormField(),
          Gap(20.h),
          CustomTextFormField(
            controller: cubit.phoneController,
            hintText: S.of(context).phone,
            keyboardType: TextInputType.phone,
            prefixIcon: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              child: Icon(
                Icons.phone,
                size: 20.h,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Gap(20.h),
          const GenderSelectionMenu(),
          Gap(30.h),
        ],
      ),
    );
  }
}
