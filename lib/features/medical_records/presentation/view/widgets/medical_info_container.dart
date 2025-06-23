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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: .15),
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppStyles.medium16(context).copyWith(
              color: AppColors.black.withValues(alpha: .4),
            ),
          ),
          Gap(10.h),
          Expanded(
            child: Text(
              info,
              style: AppStyles.medium15(context),
            ),
          ),
        ],
      ),
    );
  }
}
