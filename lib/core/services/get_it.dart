import 'package:get_it/get_it.dart';
import 'package:patient_app/core/database/api/api_consumer.dart';
import 'package:patient_app/core/database/api/dio_consumer.dart';
import 'package:patient_app/core/database/api/dio_factory.dart';
import 'package:patient_app/core/database/cache/cashe_helper.dart';
import 'package:patient_app/features/edit_profile/data/repo/edit_profile_repo.dart';
import 'package:patient_app/features/edit_profile/data/repo/edit_profile_repo_impl.dart';
import 'package:patient_app/features/forget_password/data/repository/forget_password_repo.dart';
import 'package:patient_app/features/forget_password/data/repository/forget_password_repo_impl.dart';
import 'package:patient_app/features/make_appointment/data/repos/add_review_repo.dart';
import 'package:patient_app/features/make_appointment/data/repos/add_review_repo_impl.dart';
import 'package:patient_app/features/make_appointment/data/repos/make_appointment_repo.dart';
import 'package:patient_app/features/make_appointment/data/repos/make_appointment_repo_impl.dart';
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

  getIt.registerLazySingleton<OrderLogRepo>(
    () => OrderLogRepoImpl(getIt<ApiConsumer>()),
  );

  getIt.registerLazySingleton<AddReviewRepo>(
    () => AddReviewRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );

  getIt.registerLazySingleton<MakeAppointmentRepo>(
    () => MakeAppointmentRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );
}
