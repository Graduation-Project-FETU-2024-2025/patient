import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/Doctors/data/repos/doctors_repo.dart';
import 'package:patient_app/features/home/data/models/doctor_model.dart';

part 'doctors_state.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  DoctorsCubit(this.doctorsRepo) : super(DoctorsInitial());
  final DoctorsRepo doctorsRepo;
  void getDoctors() async {
    emit(DoctorsLoading());
    final result = await doctorsRepo.getDoctors();
    result.fold(
      (error) => emit(
        DoctorsFailure(apiErrorModel: error),
      ),
      (doctors) => emit(
        DoctorsSuccess(doctors: doctors.items),
      ),
    );
  }
}
