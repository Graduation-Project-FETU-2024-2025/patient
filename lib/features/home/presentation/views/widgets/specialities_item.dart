import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/database/cache/cashe_helper.dart';
import 'package:patient_app/core/services/get_it.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/features/all_Specialities/data/models/specialities_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SpecialitiesItem extends StatelessWidget {
  const SpecialitiesItem({
    super.key,
    required this.specialitiesModel,
  });
  final SpecialitiesModel specialitiesModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 20),
      child: Column(
        children: [
          Container(
            height: 70.h,
            width: 70.w,
            decoration: ShapeDecoration(
              shape: const CircleBorder(),
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.black.withValues(alpha: 0.1)
                  : AppColors.white.withValues(alpha: 0.1),
            ),
            child: Skeleton.ignore(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: CachedNetworkImage(
                  imageUrl: specialitiesModel.icon,
                ),
              ),
            ),
          ),
          Gap(10.h),
          Text(
            getIt<CacheHelper>().getCurrentLanguage() == 'en'
                ? specialitiesModel.enName
                : specialitiesModel.arName,
            style: AppStyles.semiBold12(context).copyWith(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.black.withValues(alpha: 0.4)
                  : AppColors.white.withValues(alpha: 0.4),
            ),
          ),
        ],
      ),
    );
  }
}
