import 'package:get_it/get_it.dart';
import 'package:patient_app/core/database/api/api_consumer.dart';
import 'package:patient_app/core/database/api/dio_consumer.dart';
import 'package:patient_app/core/database/api/dio_factory.dart';
import 'package:patient_app/core/database/cache/cashe_helper.dart';
import 'package:patient_app/features/all_Specialities/data/repos/get_all_specialities_repo.dart';
import 'package:patient_app/features/all_Specialities/data/repos/get_all_specialities_repo_impl.dart';
import 'package:patient_app/features/all_doctors/data/repos/get_all_doctors_repo.dart';
import 'package:patient_app/features/all_doctors/data/repos/get_all_doctors_repo_impl.dart';
import 'package:patient_app/features/doctor_details/data/repos/get_details_doctor_repo.dart';
import 'package:patient_app/features/doctor_details/data/repos/get_details_doctor_repo_impl.dart';
import 'package:patient_app/features/edit_profile/data/repo/edit_profile_repo.dart';
import 'package:patient_app/features/edit_profile/data/repo/edit_profile_repo_impl.dart';
import 'package:patient_app/features/forget_password/data/repository/forget_password_repo.dart';
import 'package:patient_app/features/forget_password/data/repository/forget_password_repo_impl.dart';
import 'package:patient_app/features/home/data/repos/get_specialites_repo.dart';
import 'package:patient_app/features/home/data/repos/get_specialities_repo_impl.dart';
import 'package:patient_app/features/home/data/repos/get_top_doctors_repo.dart';
import 'package:patient_app/features/home/data/repos/get_top_doctors_repo_impl.dart';
import 'package:patient_app/features/medical_records/data/repository/medical_records_repo.dart';
import 'package:patient_app/features/medical_records/data/repository/medical_records_repo_impl.dart';
import 'package:patient_app/features/orders_log/data/repository/order_log_repo.dart';
import 'package:patient_app/features/orders_log/data/repository/order_log_repo_impl.dart';
import 'package:patient_app/features/profile/data/repo/profile_repo.dart';
import 'package:patient_app/features/profile/data/repo/profile_repo_impl.dart';
import 'package:patient_app/features/sign_in/data/repository/sign_in_repo.dart';
import 'package:patient_app/features/sign_in/data/repository/sign_in_repo_impl.dart';
import 'package:patient_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:patient_app/features/sign_up/data/repos/sign_up_repo_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());

  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(
      dio: DioFactory.getDio(),
    ),
  );

  // signIn
  getIt.registerLazySingleton<SignInRepo>(
    () => SignInRepoImpl(getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<SignUpRepo>(
    () => SignUpRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );

  // reset password
  getIt.registerLazySingleton<ForgetPasswordRepo>(
      () => ForgetPasswordRepoImpl(apiConsumer: getIt<ApiConsumer>()));

  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );

  getIt.registerLazySingleton<EditProfileRepo>(
    () => EditProfileRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );

  getIt.registerLazySingleton<MedicalRecordsRepo>(
    () => MedicalRecordsRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<GetAllDoctorsRepo>(
    () => GetAllDoctorsRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<GetAllSpecialitiesRepo>(
    () => GetAllSpecialitiesRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<GetDetailsDoctorRepo>(
    () => GetDetailsDoctorRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<GetSpecialitesRepo>(
    () => GetSpecialitiesRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<GetTopDoctorsRepo>(
    () => GetTopDoctorsRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );

  getIt.registerLazySingleton<OrderLogRepo>(
    () => OrderLogRepoImpl(getIt<ApiConsumer>()),
  );
}
