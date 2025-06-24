part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final String successMessage;

  SignUpSuccess({required this.successMessage});
}

final class SignUpFailure extends SignUpState {
  final ApiErrorModel errorModel;

  SignUpFailure({required this.errorModel});
}

final class SignUpGenderChanged extends SignUpState {}

final class SignUpBirthDateChanged extends SignUpState {}

final class PickImageDone extends SignUpState {}
