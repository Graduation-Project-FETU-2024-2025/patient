import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/generated/l10n.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).alreadyHaveAnAccount,
          style: AppStyles.medium16(context).copyWith(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.black.withValues(alpha: 0.3)
                : AppColors.white.withValues(alpha: 0.3),
          ),
        ),
        Gap(10.h),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Text(
            S.of(context).login,
            style: AppStyles.medium16(context).copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
