import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/all_Specialities/data/models/specialities_model.dart';
import 'package:patient_app/features/all_Specialities/data/repos/get_all_specialities_repo.dart';

part 'get_all_specialities_state.dart';

class GetAllSpecialitiesCubit extends Cubit<GetAllSpecialitiesState> {
  GetAllSpecialitiesCubit(this.getAllSpecialitiesRepo)
      : super(GetAllSpecialitiesInitial());
  final GetAllSpecialitiesRepo getAllSpecialitiesRepo;
  void getAllSpecialities() async {
    emit(GetAllSpecialitiesLoading());
    final result = await getAllSpecialitiesRepo.getSpecialities();
    result.fold(
      (error) => emit(
        GetAllSpecialitiesFailure(apiErrorModel: error),
      ),
      (specialities) => emit(
        GetAllSpecialitiesSucess(specialitiesList: specialities.data),
      ),
    );
  }
}
