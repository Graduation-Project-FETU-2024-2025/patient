import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_styles.dart';
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
                AdvertisingListView(),
                Gap(50.h),
                SpecialtiesSection(),
                Gap(50.h),
                Text(
                  S.of(context).highlyRecommended,
                  style: AppStyles.semiBold25(context).copyWith(fontSize: 24),
                ),
                Gap(30.h),
                HighlyRecommListView(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
