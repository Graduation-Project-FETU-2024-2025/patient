import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_images.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/features/make_appointment/presentation/view_models/make_appointment/make_appointment_cubit.dart';
import 'package:patient_app/generated/l10n.dart';

class DateField extends StatefulWidget {
  const DateField({super.key});

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MakeAppointmentCubit>();

    return SizedBox(
      height: 54,
      child: DateTimeField(
        value: cubit.appointmentDate,
        onChanged: (value) {
          if (value != null) {
            cubit.changeAppointmentDate(value);
            setState(() {});
          }
        },
        style: AppStyles.semiBold14(context)
            .copyWith(color: AppColors.primaryColor),
        mode: DateTimeFieldPickerMode.date,
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.black.withValues(alpha: 0.3)
                  : AppColors.white.withValues(alpha: 0.6),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.black.withValues(alpha: 0.3)
                  : AppColors.white.withValues(alpha: 0.3),
            ),
          ),
          hintText: S.of(context).date,
          hintStyle: AppStyles.semiBold14(context).copyWith(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.black.withValues(alpha: 0.3)
                : AppColors.white.withValues(alpha: 0.3),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 12.0,
            ),
            child: Image.asset(
              AppImages.imagesCalender,
              height: 10.h,
              width: 10.w,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.black
                  : AppColors.white,
            ),
          ),
        ),
        initialPickerDateTime: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.utc(2100),
        dateFormat: DateFormat('yyyy-MM-dd'),
      ),
    );
  }
}
