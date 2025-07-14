import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/features/all_Specialities/presentation/view_models/get_all_specialites/get_all_specialities_cubit.dart';
import 'package:patient_app/features/all_Specialities/presentation/views/widgets/all_Specialities_grid.dart';
import 'package:patient_app/features/all_Specialities/presentation/views/widgets/all_specialities_app_bar.dart';

class AllSpecialitiesViewBody extends StatelessWidget {
  const AllSpecialitiesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.primaryColor,
      onRefresh: () async {
        context.read<GetAllSpecialitiesCubit>().getAllSpecialities();
      },
      child: const SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            AllSpecialitiesAppBar(),
            Gap(30),
            AllSpecialitiesGrid(),
          ],
        ),
      ),
    );
  }
}
