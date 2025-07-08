import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/database/cache/cashe_helper.dart';
import 'package:patient_app/core/routers/routing.dart';
import 'package:patient_app/core/services/get_it.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_icons.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/features/home/presentation/view_models/get_specialites/get_specialities_cubit.dart';
import 'package:patient_app/features/home/presentation/view_models/get_top_doctors/get_top_doctors_cubit.dart';
import 'package:patient_app/features/home/presentation/views/widgets/advertising_list_view.dart';
import 'package:patient_app/features/home/presentation/views/widgets/highly_recomm_list_view.dart';
import 'package:patient_app/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:patient_app/features/home/presentation/views/widgets/specialties_section.dart';
import 'package:patient_app/generated/l10n.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.primaryColor,
      onRefresh: () async {
        context.read<GetSpecialitiesCubit>().getSpecialities();
        context.read<GetTopDoctorsCubit>().getTopDoctors();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            const HomeAppBar(),
            Gap(20.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 32.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AdvertisingPageView(),
                  Gap(50.h),
                  const SpecialtiesSection(),
                  Gap(50.h),
                  Row(
                    children: [
                      Text(
                        S.of(context).highlyRecommended,
                        style: AppStyles.semiBold25(context)
                            .copyWith(fontSize: 24),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          Routing.doctors,
                        ),
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
                              child: SvgPicture.asset(
                                  AppIcons.svgsIconamooarrowUp),
                            )
                          : SvgPicture.asset(
                              AppIcons.svgsIconamooarrowUp,
                            ),
                    ],
                  ),
                  Gap(30.h),
                  const HighlyRecommListView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
