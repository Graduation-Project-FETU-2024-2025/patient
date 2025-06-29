import 'package:flutter/material.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_images.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/generated/l10n.dart';

class NoOrderWidget extends StatelessWidget {
  const NoOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppImages.imagesNoItem),
        const SizedBox(height: 16),
         Text(
          S.of(context).noOrdersYet,
          style: AppStyles.medium16(context).copyWith(color: AppColors.darkWhite),
        ),
      ],
    );
  }
}