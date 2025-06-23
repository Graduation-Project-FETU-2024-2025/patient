import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/utils/app_styles.dart';
import 'package:patient_app/features/medical_records/presentation/view/widgets/medical_records_success_body.dart';
import 'package:patient_app/features/medical_records/presentation/view_model/medical_records_cubit/medical_records_cubit.dart';
import 'package:patient_app/features/medical_records/presentation/view_model/medical_records_cubit/medical_records_state.dart';
import 'package:patient_app/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomUserMedicalRecordsContainer extends StatelessWidget {
  const CustomUserMedicalRecordsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicalRecordsCubit, MedicalRecordsState>(
        builder: (context, state) {
      if (state is MedicalRecordsSuccess) {
        return MedicalRecordSuccessBody(
          medicalRecordsModel: state.medicalRecordsModel,
        );
      } else if (state is MedicalRecordsFailure) {
        return Center(
          child: Text(
            state.apiErrorModel.message ?? S.of(context).someThingWentWrong,
            style: AppStyles.medium18(context),
          ),
        );
      }
      return const Skeletonizer(
          enabled: true,
          child:
              MedicalRecordSuccessBody()); // Return an empty widget if no state matches
    });
  }
}

