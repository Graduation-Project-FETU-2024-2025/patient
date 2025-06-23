import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/routers/routing.dart';
import 'package:patient_app/core/services/get_it.dart';
import 'package:patient_app/features/all_doctors/presentation/views/all_doctors.dart';
import 'package:patient_app/features/forget_password/data/repository/forget_password_repo.dart';
import 'package:patient_app/features/forget_password/presentation/view/email_view.dart';
import 'package:patient_app/features/forget_password/presentation/view/otp_view.dart';
import 'package:patient_app/features/forget_password/presentation/view/reset_password.dart';
import 'package:patient_app/features/forget_password/presentation/view_model/otp_cubit/otp_cubit.dart';
import 'package:patient_app/features/forget_password/presentation/view_model/reset_password_cubit/reset_password_cubit.dart';
import 'package:patient_app/features/forget_password/presentation/view_model/send_otp_cubit/send_otp_cubit.dart';
import 'package:patient_app/features/home/presentation/views/home_view.dart';
import 'package:patient_app/features/main/presentation/view/main_view.dart';
import 'package:patient_app/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:patient_app/features/sign_in/data/repository/sign_in_repo.dart';
import 'package:patient_app/features/sign_in/presentation/view/sign_in_view.dart';
import 'package:patient_app/features/sign_in/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:patient_app/features/splash/presentation/view/splash_view.dart';

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
        return _buildRoute(const Scaffold());
      case Routing.homeView:
        return _buildRoute(const HomeView());
      case Routing.allDoctorsView:
        return _buildRoute(const AllDoctors());
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
      case Routing.main:
        return _buildRoute(const MainView());
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
