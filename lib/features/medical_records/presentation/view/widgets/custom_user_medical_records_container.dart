import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/features/medical_records/presentation/view/widgets/medical_info_grid.dart';
import 'package:patient_app/features/medical_records/presentation/view/widgets/user_name_section.dart';
import 'package:patient_app/generated/l10n.dart';

class CustomUserMedicalRecordsContainer extends StatelessWidget {
  const CustomUserMedicalRecordsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 6.0,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).patientHistory,
              style: AppStyles.semiBold20(context).copyWith(
                color: Colors.black.withValues(alpha: .4),
              ),
            ),
            const Divider(),
            Gap(50.h),
            const UserNameSection(),
            Gap(20.h),
            Text(
              S.of(context).generalInfo,
              style: AppStyles.medium18(context),
            ),
            Gap(15.h),
            MedicalInfoGrid(
              medicalInfo: {
                S.of(context).gender: "Male",
                S.of(context).address: "123 Main St, City, Country",
                S.of(context).age: "30",
              },
            ),
            Gap(30.h),
            Text(
              S.of(context).contact,
              style: AppStyles.medium18(context),
            ),
            Gap(15.h),
            MedicalInfoGrid(
              medicalInfo: {
                S.of(context).phoneNumber: "+1234567890",
                S.of(context).email: "khaled@gmail.com",
              },
            ),
            Gap(30.h),
            const Divider(),
            Gap(15.h),
            Text(
              S.of(context).lastVisit,
              style: AppStyles.medium18(context),
            ),
            Gap(15.h),
            MedicalInfoGrid(
              medicalInfo: {
                S.of(context).DateOfVisit: "2023-10-01",
                S.of(context).diagnosis: "Flu-like symptoms",
                S.of(context).chiefComplaint:
                    "Fever and cough fjodfdksfjk fkldkf;lsdjf fdjlfdlkfjsdif fkd;lfjsdljfsdofj fpdkfposdjfiosdjf fkpdojfposdjf pdofjsdojf",
              },
            ),
          ],
        ),
      ),
    );
  }
}
