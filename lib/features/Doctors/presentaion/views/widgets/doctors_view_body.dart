import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/features/Doctors/presentaion/view_models/doctors/doctors_cubit.dart';
import 'package:patient_app/features/Doctors/presentaion/views/widgets/doctors_app_bar.dart';
import 'package:patient_app/features/Doctors/presentaion/views/widgets/doctors_list_view.dart';

class DoctorsViewBody extends StatelessWidget {
  const DoctorsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.primaryColor,
      onRefresh: () async {
        context.read<DoctorsCubit>().getDoctors();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            const DoctorsAppBar(),
            Gap(30.h),
            const DoctorsListView(),
          ],
        ),
      ),
    );
  }
}
