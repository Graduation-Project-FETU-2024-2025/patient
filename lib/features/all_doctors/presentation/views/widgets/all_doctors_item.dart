import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/database/cache/cashe_helper.dart';
import 'package:patient_app/core/services/get_it.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/features/home/data/models/doctor_model.dart';
import 'package:patient_app/generated/l10n.dart';

import '../../../../../core/utils/app_styles.dart';

class AllDoctorsItem extends StatelessWidget {
  const AllDoctorsItem({super.key, required this.doctorModel});
  final DoctorModel doctorModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.r),
        ),
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.white
            : AppColors.white.withValues(alpha: 0.2),
        shadows: [
          const BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 3,
            offset: Offset(0, 3),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            Container(
              width: 87,
              height: 102,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    doctorModel.image!,
                  ),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            Gap(10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorModel.fullName,
                  style: AppStyles.semiBold15(context),
                ),
                Gap(5.h),
                Text(
                  '${getIt<CacheHelper>().getCurrentLanguage() == 'en' ? doctorModel.specialization.enName : doctorModel.specialization.arName} | ${doctorModel.clinicName}',
                  style: AppStyles.semiBold12(context).copyWith(
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColors.black.withValues(alpha: .4)
                        : AppColors.white.withValues(alpha: .4),
                  ),
                ),
                Gap(5.h),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16.sp,
                    ),
                    Gap(5.w),
                    Text(
                      '${doctorModel.rating} (${doctorModel.reviewsCount} Reviews)',
                      style: AppStyles.semiBold10(context).copyWith(
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColors.black.withValues(alpha: .4)
                            : AppColors.white.withValues(alpha: .4),
                      ),
                    ),
                  ],
                ),
                Gap(5.h),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).avaliableAppointments,
                          style: AppStyles.semiBold10(context).copyWith(
                            fontSize: 6,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColors.black.withValues(alpha: .4)
                                    : AppColors.white.withValues(alpha: .4),
                          ),
                        ),
                        Gap(3.h),
                        Text(
                          doctorModel.nextAvailableAppointment ?? '',
                          style: AppStyles.semiBold10(context).copyWith(
                            fontSize: 6,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
