import 'package:flutter/material.dart';

import 'patient_schedule_container.dart';

class PatientScheduleContainerListView extends StatelessWidget {
  const PatientScheduleContainerListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final List<Color> colors = const [
      Color(0xffF28A51),
      Color(0xff4169E1),
      Color(0xff05B56F),
    ];
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {},
        child: PatientScheduleContainer(
          backgroundColor: colors[index % colors.length],
        ),
      ),
    );
  }
}
