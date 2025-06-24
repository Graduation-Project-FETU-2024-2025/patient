import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_images.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../generated/l10n.dart';
import 'widgets/appointment_detail_header.dart';
import 'widgets/patient_detail_section.dart';

class AppointmentRequestView extends StatelessWidget {
  const AppointmentRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppointmentDetailsHeader(
            // date: patientAppointmentModel.time,
            date: DateTime.now(),
          ),
          Gap(60.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
              children: [
                const PatientDetailsSection(
                    imageUrl: AppImages.imagesPersonAvatar,
                    name: "Ahmed Mohamed"),
                Gap(40.h),
                Text(
                  '${S.of(context).patientComment}:\n${"Hello Dr. Mohamed, I going to bring my complete blood count analysis with me."}',
                  style: AppStyles.semiBold18(context).copyWith(
                    height: 3,
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.color!
                        .withValues(alpha: .5),
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
                        SvgPicture.asset(AppIcons.svgsIconAttachment),
                        Text(
                          "complete blood count",
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
