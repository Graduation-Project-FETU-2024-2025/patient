import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/features/make_appointment/presentation/view_models/make_appointment/make_appointment_cubit.dart';
import 'package:patient_app/generated/l10n.dart';

class TimeSection extends StatelessWidget {
  const TimeSection({
    super.key,
    required this.cubit,
    required this.timeSlots,
  });

  final MakeAppointmentCubit cubit;
  final List<String> timeSlots;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).time,
          style: AppStyles.semiBold14(context),
        ),
        Gap(10.h),
        BlocBuilder<MakeAppointmentCubit, MakeAppointmentState>(
          builder: (context, state) {
            final selected = cubit.selectedTimeSlot;
            return Wrap(
              spacing: 16.w,
              runSpacing: 16.h,
              children: timeSlots.map((time) {
                final isSelected = selected == time;
                return GestureDetector(
                  onTap: () {
                    cubit.selectTimeSlot(time);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: 140.w,
                    height: 48.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primaryColor
                          : Theme.of(context).brightness == Brightness.light
                              ? AppColors.primaryColor.withValues(alpha: .1)
                              : AppColors.primaryColor.withValues(alpha: .3),
                      borderRadius:
                          BorderRadius.circular(isSelected ? 16.r : 12.r),
                    ),
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: AppStyles.medium15(context).copyWith(
                        color: isSelected
                            ? Colors.white
                            : Theme.of(context).brightness == Brightness.light
                                ? AppColors.black.withValues(alpha: 0.4)
                                : AppColors.white.withValues(alpha: 0.4),
                      ),
                      child: Text(time),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
