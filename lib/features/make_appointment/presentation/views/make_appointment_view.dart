import 'package:flutter/material.dart';
import 'package:patient_app/features/make_appointment/presentation/views/widgets/make_appointment_view_body.dart';

class MakeAppointmentView extends StatelessWidget {
  const MakeAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MakeAppointmentViewBody(),
    );
  }
}
