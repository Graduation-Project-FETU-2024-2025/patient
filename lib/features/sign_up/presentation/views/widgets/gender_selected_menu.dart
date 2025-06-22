import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_images.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/features/sign_up/presentation/view_models/sign_up/sign_up_cubit.dart';
import 'package:patient_app/generated/l10n.dart';

class GenderSelectionMenu extends StatelessWidget {
  const GenderSelectionMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return DropdownButtonFormField<String>(
      value: cubit.selectedGender,
      hint: Text(
        S.of(context).gender,
        style: AppStyles.medium18(context).copyWith(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w400,
        ),
      ),
      validator: (value) {
        if (value == null) {
          return S.of(context).Pleaseselectyourgender;
        }
        return null;
      },
      items: [
        DropdownMenuItem(
          value: S.of(context).male,
          child: Text(S.of(context).male),
        ),
        DropdownMenuItem(
          value: S.of(context).female,
          child: Text(S.of(context).female),
        ),
      ],
      onChanged: (value) {
        cubit.changeGender(value);
      },
      icon: const Icon(
        Icons.arrow_drop_down,
        color: AppColors.primaryColor,
      ),
      iconSize: 30,
      style: AppStyles.medium18(context).copyWith(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        fillColor: AppColors.primaryColor.withValues(alpha: .2),
        filled: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: Image.asset(
            AppImages.imagesGender,
            height: 10.h,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
