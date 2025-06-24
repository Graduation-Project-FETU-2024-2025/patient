import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_images.dart';
import 'package:patient_app/core/utils/app_styles.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.h),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundImage: AssetImage(AppImages.imagesResetPassword),
            ),
            const Gap(10),
            Text(
              'Hi, Khaled!',
              style: AppStyles.semiBold20(context).copyWith(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.white
                    : AppColors.black,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
