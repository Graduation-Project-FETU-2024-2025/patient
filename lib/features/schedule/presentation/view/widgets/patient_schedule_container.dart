import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';

class PatientScheduleContainer extends StatelessWidget {
  const PatientScheduleContainer({
    super.key,
    required this.backgroundColor,
  });
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
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
            backgroundImage:
                // isNetworkImage(
                //   patientAppointmentModel.patientImageUrl,
                // )
                //     ? CachedNetworkImageProvider(
                //         patientAppointmentModel.patientImageUrl,
                //       )
                //     :
                const AssetImage(AppImages.imagesPersonAvatar),
          ),
          Gap(10.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ahmed Mohamed",
                style: AppStyles.semiBold15(context)
                    .copyWith(color: AppColors.white),
              ),
              Gap(10.h),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.svgsIconClock),
                  Gap(10.w),
                  Text(
                    '${DateFormat('hh:mm a').format(DateTime.now())} - ${DateFormat('hh:mm a').format(
                      DateTime.now().add(
                        const Duration(
                          hours: 1,
                        ),
                      ),
                    )}',
                    style: AppStyles.semiBold10(context).copyWith(
                      color: AppColors.white.withOpacity(.6),
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
