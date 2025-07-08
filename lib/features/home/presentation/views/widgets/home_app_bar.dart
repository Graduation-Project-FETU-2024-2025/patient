import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/database/cache/cache_keys.dart';
import 'package:patient_app/core/database/cache/cashe_helper.dart';
import 'package:patient_app/core/functions/is_network_image.dart';
import 'package:patient_app/core/services/get_it.dart';
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
              backgroundImage: isNetworkImage(getIt<CacheHelper>()
                          .getString(key: CacheKeys.profileImage)) &&
                      getIt<CacheHelper>()
                              .getString(key: CacheKeys.profileImage) !=
                          null
                  ? CachedNetworkImageProvider(getIt<CacheHelper>()
                      .getString(key: CacheKeys.profileImage)!)
                  : const AssetImage(AppImages.imagesPersonAvatar),
            ),
            const Gap(10),
            Text(
              'Hi, ${getIt<CacheHelper>().getString(key: CacheKeys.username)}!',
              style: AppStyles.semiBold20(context).copyWith(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.white
                    : AppColors.black,
              ),
            ),
            const Spacer(),
            Container(
              width: 30,
              height: 30,
              decoration: const ShapeDecoration(
                shape: CircleBorder(),
                color: AppColors.white,
              ),
              child: Image.asset(AppImages.imagesNotification),
            ),
          ],
        ),
      ),
    );
  }
}
