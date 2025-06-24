import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/generated/l10n.dart';

class BookingSection extends StatelessWidget {
  const BookingSection({
    super.key,
  });

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
            color: Colors.white,
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
                    imageUrl:
                        'https://www.shutterstock.com/image-photo/portrait-handsome-male-doctor-stethoscope-600nw-2480850611.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Gap(10.w),
                Column(
                  children: [
                    Text(
                      'Dermatology',
                      style: AppStyles.semiBold18(context)
                          .copyWith(color: AppColors.primaryColor),
                    ),
                    Gap(8.h),
                    Row(
                      children: [
                        Text(
                          '4.5',
                          style: AppStyles.semiBold12(context),
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Gap(5.w),
                        Text(
                          '(120 Reviews)',
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
                Spacer(),
                Text(
                  r'$150.00',
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
