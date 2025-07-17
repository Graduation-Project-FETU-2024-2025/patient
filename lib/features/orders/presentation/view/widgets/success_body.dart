import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/core/models/medicine_model.dart';
import 'package:patient_app/features/orders/presentation/view/widgets/custom_medicine_card.dart';

class SuccessBody extends StatelessWidget {
  const SuccessBody({
    super.key,
    required this.medicines,
  });
  final List<MedicineModel> medicines;
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20.h,
        crossAxisSpacing: 20.w,
        childAspectRatio: .9,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return CustomMedicineCard(medicine: medicines[index]);
        },
        childCount: medicines.length,
      ),
    );
  }
}
