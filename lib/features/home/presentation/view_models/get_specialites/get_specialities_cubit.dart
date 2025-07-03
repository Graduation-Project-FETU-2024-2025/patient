import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/all_Specialities/data/models/specialities_model.dart';
import 'package:patient_app/features/home/data/repos/get_specialites_repo.dart';

part 'get_specialities_state.dart';

class GetSpecialitiesCubit extends Cubit<GetSpecialitiesState> {
  GetSpecialitiesCubit(this.getSpecialitiesRepo)
      : super(GetSpecialitiesInitial());
  final GetSpecialitesRepo getSpecialitiesRepo;

  void getSpecialities() async {
    emit(GetSpecialitiesLoading());

    final result = await getSpecialitiesRepo.getSpecialities();

    result.fold((error) {
      emit(
        GetSpecialitiesError(errorModel: error),
      );
    }, (specialities) {
      emit(
        GetSpecialitiesSuccess(specialities: specialities.data),
      );
    });
  }
}
