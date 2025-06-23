import 'package:flutter/material.dart';
import 'package:patient_app/features/all_doctors/presentation/views/widgets/all_doctors_item.dart';

class AllDoctorsListView extends StatelessWidget {
  const AllDoctorsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: AllDoctorsItem(),
          );
        },
        itemCount: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
