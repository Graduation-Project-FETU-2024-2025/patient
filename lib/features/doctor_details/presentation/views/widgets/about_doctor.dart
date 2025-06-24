import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/generated/l10n.dart';

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).aboutDoctor,
          style: AppStyles.semiBold15(context),
        ),
        Gap(10.h),
        Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            color: const Color(0xffE3E9FB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: [
              const BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 2,
                offset: Offset(0, 2),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 43),
            child: Text(
              'A doctor is a medical professional who has completed the necessary education and training to diagnose, treat, and prevent illnesses and injuries in individuals.',
              style: AppStyles.semiBold15(context).copyWith(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.black.withValues(alpha: 0.6)
                    : AppColors.white.withValues(
                        alpha: 0.6,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
