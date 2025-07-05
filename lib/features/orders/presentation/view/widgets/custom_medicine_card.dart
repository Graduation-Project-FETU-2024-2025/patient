


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_images.dart';
import 'package:patient_app/core/utils/app_styles.dart';



class CustomMedicineCard extends StatelessWidget {
  const CustomMedicineCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.white
            : AppColors.darkWhite,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColors.gray
              : AppColors.darkGray,
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            AppImages.imagesMedicin,
            fit: BoxFit.cover,
            height: 100,
          ),
          Gap(5.h),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Abacavir',
                  style: AppStyles.semiBold14(context),
                ),
                Gap(30.w),
                Text(
                  '\$90.00',
                  style: AppStyles.semiBold12(context)
                      .copyWith(color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
