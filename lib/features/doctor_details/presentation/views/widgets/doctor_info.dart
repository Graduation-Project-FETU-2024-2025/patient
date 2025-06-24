import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_styles.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.location_on, color: AppColors.red),
            Gap(10.w),
            Text(
              'Egypt, Tanta, El Estad Street',
              style: AppStyles.semiBold15(context).copyWith(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.black.withValues(alpha: 0.4)
                    : AppColors.white.withValues(alpha: 0.4),
              ),
            ),
          ],
        ),
        Gap(20.h),
        Row(
          children: [
            const Icon(Icons.phone, color: AppColors.red),
            Gap(10.w),
            Text(
              '0108749834685',
              style: AppStyles.semiBold15(context).copyWith(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.black.withValues(alpha: 0.4)
                    : AppColors.white.withValues(alpha: 0.4),
              ),
            ),
          ],
        ),
        Gap(20.h),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber),
            Gap(10.w),
            Text(
              '4.5 (120 Reviews)',
              style: AppStyles.semiBold15(context).copyWith(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.black.withValues(alpha: 0.4)
                    : AppColors.white.withValues(alpha: 0.4),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
