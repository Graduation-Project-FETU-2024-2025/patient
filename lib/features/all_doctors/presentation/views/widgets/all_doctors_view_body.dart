import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/features/all_doctors/presentation/views/widgets/all_doctors_app_bar.dart';
import 'package:patient_app/features/all_doctors/presentation/views/widgets/all_doctors_list_view.dart';

class AllDoctorsViewBody extends StatelessWidget {
  const AllDoctorsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AllDoctorsAppBar(),
          Gap(30.h),
          AllDoctorsListView(),
        ],
      ),
    );
  }
}
