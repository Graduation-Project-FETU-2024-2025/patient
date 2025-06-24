import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/features/home/presentation/views/widgets/specialities_item.dart';

class SpecialtiesListView extends StatelessWidget {
  const SpecialtiesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SpecialitiesItem();
        },
        itemCount: 6,
      ),
    );
  }
}
