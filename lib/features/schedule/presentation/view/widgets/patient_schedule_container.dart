import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../../core/functions/is_network_image.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../data/models/appointment_model.dart';

class PatientScheduleContainer extends StatelessWidget {
  const PatientScheduleContainer({
    super.key,
    required this.backgroundColor,
    required this.appointmentModel,
  });
  final Color backgroundColor;
  final AppointmentModel appointmentModel;
  @override
  Widget build(BuildContext context) {
    String formatAppointmentTime(DateTime startTime) {
      final DateTime endTime = startTime.add(const Duration(hours: 1));
      final String formattedStart = DateFormat('hh:mm a').format(startTime);
      final String formattedEnd = DateFormat('hh:mm a').format(endTime);
      return '$formattedStart - $formattedEnd';
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      margin: EdgeInsets.only(bottom: 30.h),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r), color: backgroundColor),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundImage: isNetworkImage(
              appointmentModel.userImage,
            )
                ? CachedNetworkImageProvider(
                    appointmentModel.userImage,
                  )
                : AssetImage(appointmentModel.userImage),
          ),
          Gap(10.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'dr.${appointmentModel.doctorName} | ${appointmentModel.clinicName}',
                style: AppStyles.semiBold15(context)
                    .copyWith(color: AppColors.white),
              ),
              Gap(10.h),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.svgsIconClock),
                  Gap(10.w),
                  Text(
                    formatAppointmentTime(appointmentModel.date),
                    style: AppStyles.semiBold10(context).copyWith(
                      color: AppColors.white.withValues(alpha: .6),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
