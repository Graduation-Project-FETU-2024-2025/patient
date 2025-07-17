import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/helpers/extentions.dart';
import 'package:patient_app/core/utils/app_icons.dart';
import 'package:patient_app/features/medical_records/presentation/view/widgets/custom_user_medical_records_container.dart';
import 'package:patient_app/features/medical_records/presentation/view_model/medical_records_cubit/medical_records_cubit.dart';

class MedicalRecordsView extends StatelessWidget {
  const MedicalRecordsView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async{
        context.read<MedicalRecordsCubit>().getMedicalRecords();
      },
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 32.0.w),
            children: [
              IconButton(
                onPressed: () {
                  context.pop();
                },
                alignment: AlignmentDirectional.topStart,
                icon: SvgPicture.asset(
                  AppIcons.svgsBack,
                ),
              ),
              Gap(30.h),
              const CustomUserMedicalRecordsContainer(),
              Gap(30.h),
            ],
          ),
        ),
      ),
    );
  }
}
