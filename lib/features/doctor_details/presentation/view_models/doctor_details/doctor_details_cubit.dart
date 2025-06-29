import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/doctor_details/data/repos/get_details_doctor_repo.dart';
import 'package:patient_app/features/home/data/models/doctor_model.dart';

part 'doctor_details_state.dart';

class DoctorDetailsCubit extends Cubit<DoctorDetailsState> {
  DoctorDetailsCubit(this.getDetailsDoctorRepo) : super(DoctorDetailsInitial());
  final GetDetailsDoctorRepo getDetailsDoctorRepo;

  void getDoctorsDetails({required String doctorId}) async {
    emit(DoctorDetailsLoading());
    final result = await getDetailsDoctorRepo.getDetailsDoctor(
      id: doctorId,
    );
    result.fold(
      (error) => emit(
        DoctorDetailsFailure(apiErrorModel: error),
      ),
      (doctor) => emit(
        DoctorDetailsSuccess(doctorModel: doctor.doctorModel),
      ),
    );
  }
}
