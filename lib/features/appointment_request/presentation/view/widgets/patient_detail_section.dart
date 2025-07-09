import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';

class PatientDetailsSection extends StatelessWidget {
  const PatientDetailsSection({
    super.key,
    required this.imageUrl,
    required this.doctorName,
    required this.clinicName,
  });

  final String imageUrl;
  final String doctorName;
  final String clinicName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundImage: const AssetImage(
            AppImages.imagesNoClinicImg,
          ),
        ),
        Gap(15.w),
        Text(
          '$doctorName | $clinicName',
          style: AppStyles.semiBold20(context),
        ),
      ],
    );
  }
}
