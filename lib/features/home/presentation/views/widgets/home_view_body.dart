import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/services/get_it.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/features/home/data/repos/get_specialites_repo.dart';
import 'package:patient_app/features/home/data/repos/get_top_doctors_repo.dart';
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
    return SingleChildScrollView(
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
                BlocProvider(
                  create: (context) => GetSpecialitiesCubit(
                    getIt<GetSpecialitesRepo>(),
                  )..getSpecialities(),
                  child: const SpecialtiesSection(),
                ),
                Gap(50.h),
                Text(
                  S.of(context).highlyRecommended,
                  style: AppStyles.semiBold25(context).copyWith(fontSize: 24),
                ),
                Gap(30.h),
                BlocProvider(
                  create: (context) => GetTopDoctorsCubit(
                    getIt<GetTopDoctorsRepo>(),
                  )..getTopDoctors(),
                  child: const HighlyRecommListView(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
