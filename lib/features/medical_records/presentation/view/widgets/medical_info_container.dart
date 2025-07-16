import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_styles.dart';

class MedicalInfoContainer extends StatelessWidget {
  const MedicalInfoContainer({
    super.key,
    required this.title,
    required this.info,
  });

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.primaryColor.withValues(alpha:0.25)
            : AppColors.primaryColor.withValues(alpha:0.15),
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppStyles.medium16(context).copyWith(
              color: isDark ? Colors.grey[400] : AppColors.black.withValues(alpha:0.4),
            ),
          ),
          Gap(10.h),
          Expanded(
            child: Text(
              info,
              style: AppStyles.medium15(context).copyWith(
                color: isDark ? Colors.white : AppColors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
