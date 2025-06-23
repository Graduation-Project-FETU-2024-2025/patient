import 'package:flutter/material.dart';
import 'package:patient_app/features/all_Specialities/presentation/views/widgets/specialities_item.dart';

class AllSpecialitiesGrid extends StatelessWidget {
  const AllSpecialitiesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 3,
        childAspectRatio: 1,
      ),
      shrinkWrap: true,
      itemCount: 20,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return SpecialitiesItem();
      },
    );
  }
}
