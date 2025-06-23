
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/medical_records/data/models/medical_records_model.dart';

sealed class MedicalRecordsState {}

final class MedicalRecordsInitial extends MedicalRecordsState {}

final class MedicalRecordsLoading extends MedicalRecordsState {}

final class MedicalRecordsSuccess extends MedicalRecordsState {
  final MedicalRecordsModel medicalRecordsModel;

  MedicalRecordsSuccess(this.medicalRecordsModel);
}

final class MedicalRecordsFailure extends MedicalRecordsState {
  final ApiErrorModel apiErrorModel;

  MedicalRecordsFailure({required this.apiErrorModel});
}
