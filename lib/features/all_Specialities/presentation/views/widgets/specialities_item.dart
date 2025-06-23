import 'package:flutter/material.dart';
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
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: ShapeDecoration(
            shape: const CircleBorder(),
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.black.withValues(alpha: 0.1)
                : AppColors.white.withValues(alpha: 0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              AppImages.imagesAppIcon,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Gap(5),
        Text(
          'Neurology',
          style: AppStyles.semiBold12(context).copyWith(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.black.withValues(alpha: 0.4)
                : AppColors.white.withValues(alpha: 0.4),
          ),
        ),
      ],
    );
  }
}
