import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/medical_records/data/models/medical_records_model.dart';

abstract class MedicalRecordsRepo {
  Future <Either<ApiErrorModel,MedicalRecordsModel>> getMedicalRecords();
}