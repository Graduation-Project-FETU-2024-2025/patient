import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/features/medical_records/data/repository/medical_records_repo.dart';
import 'package:patient_app/features/medical_records/presentation/view_model/medical_records_cubit/medical_records_state.dart';

class MedicalRecordsCubit extends Cubit<MedicalRecordsState> {
  MedicalRecordsCubit(this._medicalRecordsRepo)
      : super(MedicalRecordsInitial());
  final MedicalRecordsRepo _medicalRecordsRepo;

  void getMedicalRecords() async {
    emit(MedicalRecordsLoading());
    final result = await _medicalRecordsRepo.getMedicalRecords();

    result.fold(
      (failure) => emit(MedicalRecordsFailure(apiErrorModel: failure)),
      (medicalRecordsModel) =>
          emit(MedicalRecordsSuccess(medicalRecordsModel)),
    );
  }
}
