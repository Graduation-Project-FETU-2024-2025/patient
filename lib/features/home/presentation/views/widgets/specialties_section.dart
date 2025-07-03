import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/database/cache/cashe_helper.dart';
import 'package:patient_app/core/routers/routing.dart';
import 'package:patient_app/core/services/get_it.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_icons.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/features/home/presentation/views/widgets/specialities_list_view.dart';
import 'package:patient_app/generated/l10n.dart';

class SpecialtiesSection extends StatelessWidget {
  const SpecialtiesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              S.of(context).medicalSpecialites,
              style: AppStyles.semiBold25(context).copyWith(fontSize: 24),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, Routing.allSpecialitiesView),
              child: Text(
                S.of(context).seeAll,
                style: AppStyles.semiBold10(context).copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            getIt<CacheHelper>().getCurrentLanguage() == 'ar'
                ? Transform.rotate(
                    angle: 180 * 3.14 / 180,
                    child: SvgPicture.asset(AppIcons.svgsIconamooarrowUp),
                  )
                : SvgPicture.asset(
                    AppIcons.svgsIconamooarrowUp,
                  ),
          ],
        ),
        Gap(10.h),
        const SpecialtiesListView()
      ],
    );
  }
}
