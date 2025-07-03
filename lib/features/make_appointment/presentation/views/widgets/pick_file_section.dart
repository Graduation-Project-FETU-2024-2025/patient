import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_icons.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/features/make_appointment/presentation/view_models/make_appointment/make_appointment_cubit.dart';
import 'package:patient_app/generated/l10n.dart';

class PickFileSection extends StatelessWidget {
  const PickFileSection({
    super.key,
    required this.cubit,
  });

  final MakeAppointmentCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MakeAppointmentCubit, MakeAppointmentState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => cubit.pickFileFromPhone(),
          child: Container(
            width: double.infinity,
            height: 114.h,
            decoration: ShapeDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black.withValues(alpha: 0.15)
                  : Colors.white.withValues(alpha: 0.15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: cubit.pickedFile != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          cubit.pickedFile!.files.first.name,
                          style: AppStyles.medium15(context),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Gap(10),
                        IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: AppColors.secondaryColor,
                          ),
                          onPressed: () => cubit.removePickedFile(),
                        ),
                      ],
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppIcons.svgsIconAttachment),
                      Gap(10.h),
                      Text(
                        S.of(context).attachAnalysis,
                        style: AppStyles.medium15(context).copyWith(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColors.black.withValues(alpha: 0.3)
                                  : AppColors.white.withValues(alpha: 0.3),
                        ),
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }
}
