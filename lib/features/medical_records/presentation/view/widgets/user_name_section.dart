
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/database/cache/cache_keys.dart';
import 'package:patient_app/core/database/cache/cashe_helper.dart';
import 'package:patient_app/core/functions/is_network_image.dart';
import 'package:patient_app/core/services/get_it.dart';
import 'package:patient_app/core/utils/app_images.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/generated/l10n.dart';


class UserNameSection extends StatelessWidget {
  const UserNameSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundColor: isDark ? Colors.grey[800] : Colors.grey[200],
          backgroundImage: isNetworkImage(
            getIt<CacheHelper>().getString(key: CacheKeys.profileImage),
          )
              ? CachedNetworkImageProvider(
                  getIt<CacheHelper>()
                      .getString(key: CacheKeys.profileImage)!,
                )
              : const AssetImage(
                  AppImages.imagesPersonAvatar,
                ) as ImageProvider,
        ),
        Gap(10.w),
        Expanded(
          child: Text(
            getIt<CacheHelper>().getString(key: CacheKeys.username) ??
                S.of(context).unknown,
            style: AppStyles.semiBold20(context),
          ),
        ),
      ],
    );
  }
}
