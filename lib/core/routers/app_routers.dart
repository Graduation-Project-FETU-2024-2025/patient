import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/routers/routing.dart';
import 'package:patient_app/core/services/get_it.dart';
import 'package:patient_app/features/Doctors/data/repos/doctors_repo.dart';
import 'package:patient_app/features/Doctors/presentaion/view_models/doctors/doctors_cubit.dart';
import 'package:patient_app/features/Doctors/presentaion/views/doctors_view.dart';
import 'package:patient_app/features/all_Specialities/data/repos/get_all_specialities_repo.dart';
import 'package:patient_app/features/all_Specialities/presentation/view_models/get_all_specialites/get_all_specialities_cubit.dart';
import 'package:patient_app/features/all_Specialities/presentation/views/all_specialities_view.dart';
import 'package:patient_app/features/all_doctors/data/repos/get_all_doctors_repo.dart';
import 'package:patient_app/features/all_doctors/presentation/view_models/get_all_doctors/get_all_doctors_cubit.dart';
import 'package:patient_app/features/appointment_request/presentation/view/appointment_request_view.dart';
import 'package:patient_app/features/cart/data/repository/checkout_repo.dart';
import 'package:patient_app/features/cart/presentation/view/cart_view.dart';
import 'package:patient_app/features/cart/presentation/view_model/checkout_cubit/checkout_cubit.dart';
import 'package:patient_app/features/doctor_details/data/repos/get_details_doctor_repo.dart';
import 'package:patient_app/features/doctor_details/presentation/view_models/doctor_details/doctor_details_cubit.dart';
import 'package:patient_app/features/doctor_details/presentation/views/doctor_details_view.dart';
import 'package:patient_app/features/all_doctors/presentation/views/all_doctors.dart';
import 'package:patient_app/features/edit_profile/data/repo/edit_profile_repo.dart';
import 'package:patient_app/features/edit_profile/presentation/view/edit_profile_view.dart';
import 'package:patient_app/features/edit_profile/presentation/view_model/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:patient_app/features/forget_password/data/repository/forget_password_repo.dart';
import 'package:patient_app/features/forget_password/presentation/view/email_view.dart';
import 'package:patient_app/features/forget_password/presentation/view/otp_view.dart';
import 'package:patient_app/features/forget_password/presentation/view/reset_password.dart';
import 'package:patient_app/features/forget_password/presentation/view_model/otp_cubit/otp_cubit.dart';
import 'package:patient_app/features/forget_password/presentation/view_model/reset_password_cubit/reset_password_cubit.dart';
import 'package:patient_app/features/forget_password/presentation/view_model/send_otp_cubit/send_otp_cubit.dart';
import 'package:patient_app/features/home/data/models/doctor_model.dart';
import 'package:patient_app/features/home/presentation/views/home_view.dart';
import 'package:patient_app/features/main/presentation/view/main_view.dart';
import 'package:patient_app/features/make_appointment/data/repos/make_appointment_repo.dart';
import 'package:patient_app/features/make_appointment/presentation/view_models/make_appointment/make_appointment_cubit.dart';
import 'package:patient_app/features/make_appointment/presentation/views/make_appointment_view.dart';
import 'package:patient_app/features/medical_records/data/repository/medical_records_repo.dart';
import 'package:patient_app/features/medical_records/presentation/view/medical_records_view.dart';
import 'package:patient_app/features/medical_records/presentation/view_model/medical_records_cubit/medical_records_cubit.dart';
import 'package:patient_app/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:patient_app/core/models/medicine_model.dart';
import 'package:patient_app/features/orders_log/data/repository/order_log_repo.dart';
import 'package:patient_app/features/orders_log/presentation/view/orders_log_view.dart';
import 'package:patient_app/features/orders_log/presentation/view_model/cubit/order_log_cubit.dart';
import 'package:patient_app/features/profile/data/models/user_model.dart';
import 'package:patient_app/features/schedule/data/models/appointment_model.dart';
import 'package:patient_app/features/sign_in/data/repository/sign_in_repo.dart';
import 'package:patient_app/features/sign_in/presentation/view/sign_in_view.dart';
import 'package:patient_app/features/sign_in/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:patient_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:patient_app/features/sign_up/presentation/view_models/sign_up/sign_up_cubit.dart';
import 'package:patient_app/features/sign_up/presentation/views/sign_up_view.dart';
import 'package:patient_app/features/splash/presentation/view/splash_view.dart';

import '../../features/appointment_request/presentation/view_model/cubit/file_download_cubit.dart';

class AppRouters {
  Route generateRoute(RouteSettings settings) {
    var argument = settings.arguments;
    switch (settings.name) {
      case Routing.splash:
        return _buildRoute(
          const SplashView(),
        );
      case Routing.onboarding:
        return _buildRoute(
          const OnboardingView(),
        );
      case Routing.ordersLog:
        return _buildRoute(
          BlocProvider(
            create: (context) =>
                OrderLogCubit(getIt<OrderLogRepo>())..getOrders(),
            child: const OrdersLogView(),
          ),
        );
      case Routing.signIn:
        return _buildRoute(
          BlocProvider(
            create: (context) => SignInCubit(getIt<SignInRepo>()),
            child: const SignInView(),
          ),
        );
      case Routing.emailView:
        return _buildRoute(
          BlocProvider(
            create: (context) => SendOtpCubit(getIt<ForgetPasswordRepo>()),
            child: const EmailView(),
          ),
        );
      case Routing.signUp:
        return _buildRoute(BlocProvider(
          create: (context) => SignUpCubit(getIt<SignUpRepo>()),
          child: const SignUpView(),
        ));
      case Routing.doctorDetailsView:
        final String doctorId = argument as String;
        return _buildRoute(
          BlocProvider(
            create: (context) => DoctorDetailsCubit(
              getIt<GetDetailsDoctorRepo>(),
            )..getDoctorsDetails(doctorId: doctorId),
            child: const DoctorDetailsView(),
          ),
        );
      case Routing.allSpecialitiesView:
        return _buildRoute(
          BlocProvider(
            create: (context) => GetAllSpecialitiesCubit(
              getIt<GetAllSpecialitiesRepo>(),
            )..getAllSpecialities(),
            child: const AllSpecialitiesView(),
          ),
        );

      case Routing.homeView:
        return _buildRoute(const HomeView());
      case Routing.allDoctorsView:
        final String specialityId = argument as String;
        return _buildRoute(BlocProvider(
          create: (context) => GetAllDoctorsCubit(
            getIt<GetAllDoctorsRepo>(),
          )..getAllDoctors(specialityId: specialityId),
          child: AllDoctors(specialityId: specialityId),
        ));

      case Routing.medicalRecords:
        return _buildRoute(BlocProvider(
          create: (context) => MedicalRecordsCubit(getIt<MedicalRecordsRepo>())
            ..getMedicalRecords(),
          child: const MedicalRecordsView(),
        ));
      case Routing.editProfile:
        return _buildRoute(BlocProvider(
          create: (context) => EditProfileCubit(getIt<EditProfileRepo>()),
          child: EditProfileView(
            userModel: argument as UserModel,
          ),
        ));
      case Routing.restPassword:
        return _buildRoute(
          BlocProvider(
            create: (context) =>
                ResetPasswordCubit(getIt<ForgetPasswordRepo>()),
            child: ResetPassword(
              email: argument as String,
            ),
          ),
        );
      case Routing.forgetPassword:
        return _buildRoute(BlocProvider(
          create: (context) => OtpCubit(getIt<ForgetPasswordRepo>()),
          child: OtpView(
            email: argument as String,
          ),
        ));
      case Routing.makeAppointment:
        final doctorModel = argument as DoctorModel;
        return _buildRoute(BlocProvider(
          create: (context) =>
              MakeAppointmentCubit(getIt<MakeAppointmentRepo>()),
          child: MakeAppointmentView(
            doctorModel: doctorModel,
          ),
        ));
      case Routing.main:
        return _buildRoute(const MainView());
      case Routing.doctors:
        return _buildRoute(BlocProvider(
          create: (context) => DoctorsCubit(getIt<DoctorsRepo>())..getDoctors(),
          child: const DoctorsView(),
        ));
      case Routing.appointmentDetail:
        return _buildRoute(BlocProvider(
          create: (context) => FileDownloadCubit(),
          child: AppointmentRequestView(
            appointmentModel: argument as AppointmentModel,
          ),
        ));
      case Routing.cart:
        return _buildRoute(BlocProvider(
          create: (context) => CheckoutCubit(getIt<CheckoutRepo>()),
          child: CartView(
            medicinesInCart: argument as List<MedicineModel>,
          ),
        ));
      default:
        return _buildRoute(
          Scaffold(
            body: Center(child: Text('Page not found: ${settings.name}')),
          ),
        );
    }
  }

  Route<dynamic> _buildRoute(Widget page) {
    return Platform.isIOS
        ? CupertinoPageRoute(
            builder: (_) => page,
          )
        : MaterialPageRoute(builder: (_) => page);
  }
}
