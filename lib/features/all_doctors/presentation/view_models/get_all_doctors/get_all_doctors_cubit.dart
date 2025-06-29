import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/all_doctors/data/repos/get_all_doctors_repo.dart';
import 'package:patient_app/features/home/data/models/doctor_model.dart';

part 'get_all_doctors_state.dart';

class GetAllDoctorsCubit extends Cubit<GetAllDoctorsState> {
  GetAllDoctorsCubit(this.getAllDoctorsRepo) : super(GetAllDoctorsInitial());
  final GetAllDoctorsRepo getAllDoctorsRepo;
  void getAllDoctors({required String specialityId}) async {
    final result = await getAllDoctorsRepo.getAllDoctors(
      specialityId: specialityId,
    );
    result.fold(
      (error) => emit(
        GetAllDoctorsFailure(apiErrorModel: error),
      ),
      (doctors) => emit(
        GetAllDoctorsSucess(doctors: doctors.items),
      ),
    );
  }
}
