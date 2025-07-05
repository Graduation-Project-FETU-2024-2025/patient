import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/database/cache/cashe_helper.dart';
import 'package:patient_app/core/services/get_it.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/features/home/data/models/doctor_model.dart';
import 'package:patient_app/generated/l10n.dart';

class BookingSection extends StatelessWidget {
  const BookingSection({
    super.key,
    required this.doctorModel,
  });
  final DoctorModel doctorModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).bookingPrice,
          style: AppStyles.semiBold15(context),
        ),
        Gap(10.h),
        Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.white
                : AppColors.white.withValues(alpha: 0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: [
              const BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 13),
            child: Row(
              children: [
                Container(
                  width: 95,
                  height: 95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: doctorModel.image ??
                        'https://www.shutterstock.com/image-photo/portrait-handsome-male-doctor-stethoscope-600nw-2480850611.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Gap(10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getIt<CacheHelper>().getCurrentLanguage() == 'en'
                          ? doctorModel.specialization.enName
                          : doctorModel.specialization.arName,
                      style: AppStyles.semiBold18(context)
                          .copyWith(color: AppColors.primaryColor),
                    ),
                    Gap(8.h),
                    Row(
                      children: [
                        Text(
                          doctorModel.rating.toStringAsFixed(1),
                          style: AppStyles.semiBold12(context),
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Gap(5.w),
                        Text(
                          '(${doctorModel.reviewsCount} Reviews)',
                          style: AppStyles.semiBold12(context).copyWith(
                            fontSize: 11,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black.withValues(alpha: 0.4)
                                    : Colors.white.withValues(alpha: 0.4),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Text(
                  '\$${doctorModel.price}',
                  style: AppStyles.semiBold15(context)
                      .copyWith(color: AppColors.red),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
