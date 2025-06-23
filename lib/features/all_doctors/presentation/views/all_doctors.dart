import 'package:flutter/material.dart';
import 'package:patient_app/features/all_doctors/presentation/views/widgets/all_doctors_view_body.dart';

class AllDoctors extends StatelessWidget {
  const AllDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AllDoctorsViewBody(),
    );
  }
}
