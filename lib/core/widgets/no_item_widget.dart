import 'package:flutter/material.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_images.dart';
import 'package:patient_app/core/utils/app_styles.dart';

class NoItemWidget extends StatelessWidget {
  const NoItemWidget({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppImages.imagesNoItem),
        const SizedBox(height: 16),
        Text(
          message,
          style:
              AppStyles.medium16(context).copyWith(color: AppColors.darkWhite),
        ),
      ],
    );
  }
}
