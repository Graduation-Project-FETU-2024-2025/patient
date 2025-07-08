import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/features/all_doctors/presentation/view_models/get_all_doctors/get_all_doctors_cubit.dart';
import 'package:patient_app/features/all_doctors/presentation/views/widgets/all_doctors_app_bar.dart';
import 'package:patient_app/features/all_doctors/presentation/views/widgets/all_doctors_list_view.dart';

class AllDoctorsViewBody extends StatelessWidget {
  const AllDoctorsViewBody({super.key, required this.specialityId});
  final String specialityId;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.primaryColor,
      onRefresh: () async {
        context.read<GetAllDoctorsCubit>().getAllDoctors(
              specialityId: specialityId,
            );
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            const AllDoctorsAppBar(),
            Gap(30.h),
            const AllDoctorsListView(),
          ],
        ),
      ),
    );
  }
}
