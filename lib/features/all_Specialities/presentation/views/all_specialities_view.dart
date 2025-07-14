import 'package:flutter/material.dart';
import 'package:patient_app/features/all_Specialities/presentation/views/widgets/all_specialities_view_body.dart';

class AllSpecialitiesView extends StatelessWidget {
  const AllSpecialitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AllSpecialitiesViewBody(),
    );
  }
}
