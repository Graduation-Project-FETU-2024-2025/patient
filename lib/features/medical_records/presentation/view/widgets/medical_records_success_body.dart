import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/core/widgets/no_item_widget.dart';
import 'package:patient_app/features/medical_records/data/models/medical_records_model.dart';
import 'package:patient_app/features/medical_records/presentation/view/widgets/medical_info_grid.dart';
import 'package:patient_app/features/medical_records/presentation/view/widgets/user_name_section.dart';
import 'package:patient_app/generated/l10n.dart';

class MedicalRecordSuccessBody extends StatelessWidget {
  const MedicalRecordSuccessBody({
    super.key,
    this.medicalRecordsModel,
  });
  final MedicalRecordsModel? medicalRecordsModel;
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
                S.of(context).gender: medicalRecordsModel?.gender,
                S.of(context).address: "123 Main St, City, Country",
                S.of(context).age: medicalRecordsModel?.age.toString(),
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
                S.of(context).phoneNumber: medicalRecordsModel?.phoneNumber,
                S.of(context).email: medicalRecordsModel?.email,
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
            medicalRecordsModel?.appointmentModel == null
                ? NoItemWidget(message: S.of(context).noVisitYet)
                : MedicalInfoGrid(
                    medicalInfo: {
                      S.of(context).DateOfVisit: DateFormat('d MMMM, y',
                              Localizations.localeOf(context).toString())
                          .format(
                        DateTime.parse(
                          medicalRecordsModel?.appointmentModel?.date ??
                              "2025-07-09T00:00:00",
                        ),
                      ),
                      S.of(context).diagnosis: medicalRecordsModel
                              ?.appointmentModel?.prescription?.diagnosis ??
                          S.of(context).none,
                      S.of(context).chiefComplaint: medicalRecordsModel
                              ?.appointmentModel
                              ?.prescription
                              ?.prescriptionProductDTOs ??
                          S.of(context).none,
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
