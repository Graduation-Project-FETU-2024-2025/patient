import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_images.dart';
import 'package:patient_app/core/utils/app_styles.dart';

class SpecialitiesItem extends StatelessWidget {
  const SpecialitiesItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 20),
      child: Column(
        children: [
          Container(
            height: 70.h,
            width: 70.w,
            decoration: ShapeDecoration(
              shape: const CircleBorder(),
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.black.withValues(alpha: 0.1)
                  : AppColors.white.withValues(alpha: 0.1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                AppImages.imagesNeurology,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Gap(10.h),
          Text(
            'Neurology',
            style: AppStyles.semiBold12(context).copyWith(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.black.withValues(alpha: 0.4)
                  : AppColors.white.withValues(alpha: 0.4),
            ),
          ),
        ],
      ),
    );
  }
}
