import 'package:flutter/material.dart';
import 'package:patient_app/features/medical_records/presentation/view/widgets/medical_info_container.dart';

class MedicalInfoGrid extends StatelessWidget {
  const MedicalInfoGrid({super.key, required this.medicalInfo});
  final Map<String, dynamic> medicalInfo;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: medicalInfo.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 5.0, mainAxisSpacing: 5.0),
      itemBuilder: (context, index) {
        String title = medicalInfo.keys.elementAt(index);
        String info = medicalInfo[title].toString();
        return MedicalInfoContainer(title: title, info: info);
      },
    );
  }
}
