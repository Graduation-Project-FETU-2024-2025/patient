import 'package:flutter/material.dart';
import 'package:patient_app/features/Doctors/presentaion/views/widgets/doctors_view_body.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DoctorsViewBody(),
    );
  }
}
