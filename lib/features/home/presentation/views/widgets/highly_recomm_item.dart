import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_images.dart';
import 'package:patient_app/core/utils/app_styles.dart';

class HighlyRecommItem extends StatelessWidget {
  const HighlyRecommItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.r),
        ),
        color: AppColors.white,
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
                  image: AssetImage(AppImages.imagesDoctor),
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
                  'Prof.Dr. Ali Ebrahim Baher',
                  style: AppStyles.semiBold15(context),
                ),
                Gap(5.h),
                Text(
                  'Dermatology | Mayo Clinic',
                  style: AppStyles.semiBold12(context).copyWith(
                    color: AppColors.black.withValues(alpha: .4),
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
                      '4.4 (120 Reviews)',
                      style: AppStyles.semiBold10(context).copyWith(
                          color: AppColors.black.withValues(alpha: .4)),
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
