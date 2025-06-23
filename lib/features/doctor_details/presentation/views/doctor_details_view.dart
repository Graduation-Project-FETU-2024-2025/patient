import 'package:flutter/material.dart';
import 'package:patient_app/features/doctor_details/presentation/views/widgets/doctor_Sliver_app_bar.dart';
import 'package:patient_app/features/doctor_details/presentation/views/widgets/doctor_details_view_body.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          DoctorSliverAppBar(
            img:
                'https://www.shutterstock.com/image-photo/portrait-handsome-male-doctor-stethoscope-600nw-2480850611.jpg',
            isBtnValid: false,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          SliverToBoxAdapter(
            child: DoctorDetailsViewBody(),
          ),
        ],
      ),
    );
  }
}
