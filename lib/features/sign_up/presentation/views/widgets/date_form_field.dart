import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:patient_app/core/utils/app_images.dart';
import 'package:patient_app/features/sign_up/presentation/view_models/sign_up/sign_up_cubit.dart';
import 'package:patient_app/generated/l10n.dart';

class DateFormField extends StatefulWidget {
  const DateFormField({super.key});

  @override
  State<DateFormField> createState() => _DateFormFieldState();
}

class _DateFormFieldState extends State<DateFormField> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    return DateTimeField(
      value: cubit.birthDate,
      onChanged: (value) {
        if (value != null) {
          cubit.changeBirthDate(value);
          setState(() {});
        }
      },
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).inputDecorationTheme.hintStyle?.color,
            fontSize: 18,
          ),
      mode: DateTimeFieldPickerMode.date,
      decoration: InputDecoration(
        hintText: S.of(context).Birthday,
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 12.0,
          ),
          child: Image.asset(
            AppImages.imagesCalender,
            height: 10.h,
            width: 10.w,
          ),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: Image.asset(
            AppImages.imagesBirthday,
            height: 10.h,
          ),
        ),
      ),
      initialPickerDateTime: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      dateFormat: DateFormat('yyyy-MM-dd'),
    );
  }
}
