import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:patient_app/features/schedule/data/models/appointment_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../generated/l10n.dart';
import 'widgets/appointment_detail_header.dart';
import 'widgets/patient_detail_section.dart';

class AppointmentRequestView extends StatelessWidget {
  const AppointmentRequestView({super.key, required this.appointmentModel});
  final AppointmentModel appointmentModel;

  @override
  Widget build(BuildContext context) {
    String formatFullAppointmentDateTime(DateTime apiDateTime) {
      final DateTime startTime = apiDateTime;
      final DateTime endTime = startTime.add(const Duration(hours: 1));

      final String datePart =
          DateFormat('dd MMM yyyy').format(startTime).toUpperCase();
      final String timeStart = DateFormat('hh:mm a').format(startTime);
      final String timeEnd = DateFormat('hh:mm a').format(endTime);

      return '$datePart,\n$timeStart - $timeEnd';
    }

    return Scaffold(
      body: ListView(
        children: [
          AppointmentDetailsHeader(
              date: formatFullAppointmentDateTime(appointmentModel.date)),
          Gap(60.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
              children: [
                PatientDetailsSection(
                    imageUrl: appointmentModel.userImage,
                    name: appointmentModel.userName),
                Gap(40.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${S.of(context).patientComment}:\n${appointmentModel.complaint}',
                    style: AppStyles.semiBold18(context).copyWith(
                      height: 3,
                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.color!
                          .withValues(alpha: .5),
                    ),
                  ),
                ),
                Gap(20.h),
                Container(
                  height: 60,
                  width: 255,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(7)),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      spacing: 8,
                      children: [
                                GestureDetector(
                                  onTap: (){},
                                  child: SvgPicture.asset(AppIcons.svgsIconAttachment,)),
                        Text(
                          appointmentModel.prescription ?? "",
                          style: AppStyles.semiBold18(context),
                        )
                      ],
                    ),
                  ),
                ),
                Gap(50.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
