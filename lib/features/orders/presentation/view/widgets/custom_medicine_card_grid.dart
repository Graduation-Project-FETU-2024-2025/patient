import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/features/orders/presentation/view/widgets/custom_medicine_card.dart';

class CustomMedicineCardGrid extends StatelessWidget {
  const CustomMedicineCardGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20.h,
        crossAxisSpacing: 20.w,
        childAspectRatio: 1,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return const CustomMedicineCard();
        },
        childCount: 4, // Adjust the number of items as needed
      ),
    );
  }
}
