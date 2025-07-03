import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/helpers/extentions.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';

class AppointmentDetailsHeader extends StatelessWidget {
  const AppointmentDetailsHeader({super.key, required this.date});
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.35,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(
            150.r,
          ),
        ),
      ),
      child: Column(
        children: [
          Gap(15.h),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: SvgPicture.asset(
                  AppIcons.svgsAuthBackIcon,
                ),
              ),
              Text(
                S.of(context).appointmentRequest,
                style: AppStyles.medium15(context).copyWith(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.white
                      : AppColors.black,
                ),
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              date,
              style: AppStyles.semiBold30(context).copyWith(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.white
                    : AppColors.black,
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
