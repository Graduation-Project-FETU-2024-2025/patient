import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/features/all_Specialities/presentation/views/widgets/all_Specialities_grid.dart';
import 'package:patient_app/features/all_Specialities/presentation/views/widgets/all_specialities_app_bar.dart';

class AllSpecialitiesViewBody extends StatelessWidget {
  const AllSpecialitiesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AllSpecialitiesAppBar(),
          const Gap(30),
          AllSpecialitiesGrid(),
        ],
      ),
    );
  }
}
