import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/home/data/models/doctor_model.dart';
import 'package:patient_app/features/home/data/repos/get_top_doctors_repo.dart';

part 'get_top_doctors_state.dart';

class GetTopDoctorsCubit extends Cubit<GetTopDoctorsState> {
  GetTopDoctorsCubit(this.getTopDoctorsRepo) : super(GetTopDoctorsInitial());
  final GetTopDoctorsRepo getTopDoctorsRepo;
  void getTopDoctors() async {
    emit(GetTopDoctorsLoading());
    final response = await getTopDoctorsRepo.getTopDoctors();
    response.fold(
      (error) => emit(
        GetTopDoctorsFailure(errorModel: error),
      ),
      (data) => emit(
        GetTopDoctorsSuccess(topDoctors: data.items),
      ),
    );
  }
}
