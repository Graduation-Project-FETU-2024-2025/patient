import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/features/Doctors/presentaion/views/widgets/doctors_app_bar.dart';
import 'package:patient_app/features/Doctors/presentaion/views/widgets/doctors_list_view.dart';

class DoctorsViewBody extends StatelessWidget {
  const DoctorsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const DoctorsAppBar(),
          Gap(30.h),
          const DoctorsListView(),
        ],
      ),
    );
  }
}
