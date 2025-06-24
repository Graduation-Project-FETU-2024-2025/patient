import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/sign_up/data/models/sign_up_request_model.dart';
import 'package:patient_app/features/sign_up/data/repos/sign_up_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());
  GlobalKey<FormState> formkey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? selectedGender;
  DateTime? birthDate;
  XFile? pickedImage;
  final SignUpRepo signUpRepo;

  void register() async {
    if (formkey.currentState!.validate()) {
      emit(SignUpLoading());
      final result = await signUpRepo.register(
          signUpModel: SignUpRequestModel(
        email: emailController.text,
        password: passwordController.text,
        image: pickedImage!,
        confirmPassword: passwordController.text,
        gender: selectedGender!,
        birthDay: DateFormat('yyyy-MM-dd').format(birthDate!),
        userName: nameController.text,
        fullName: nameController.text,
        ssn: "000000000000",
        phoneNumber: phoneController.text,
        role: 'User',
      ));
      result.fold(
        (error) {
          emit(
            SignUpFailure(
              errorModel: error,
            ),
          );
        },
        (sucess) {
          emit(
            SignUpSuccess(
              successMessage: sucess,
            ),
          );
        },
      );
    }
  }

  void changeGender(String? gender) {
    selectedGender = gender;
    emit(SignUpGenderChanged());
  }

  void changeBirthDate(DateTime? date) {
    birthDate = date;
    emit(SignUpBirthDateChanged());
  }

  Future pickImageFromGallery() async {
    pickedImage = await _pickImage(source: ImageSource.gallery);
    pickedImage != null ? emit(PickImageDone()) : null;
  }

  Future<XFile?> _pickImage({required ImageSource source}) async {
    final ImagePicker picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
    return pickedImage; // no need for manual null check
  }

  void cancelImage() {
    pickedImage = null;
    emit(PickImageDone());
  }
}
