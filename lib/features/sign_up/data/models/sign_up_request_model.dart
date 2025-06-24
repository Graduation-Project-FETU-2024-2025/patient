import 'package:image_picker/image_picker.dart';

class SignUpRequestModel {
  final String email;
  final String password;
  final String confirmPassword;
  final String gender;
  final String birthDay;
  final String userName;
  final String fullName;
  final XFile image;
  final String ssn;
  final String phoneNumber;
  final String role;

  SignUpRequestModel({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.gender,
    required this.birthDay,
    required this.userName,
    required this.fullName,
    required this.image,
    required this.ssn,
    required this.phoneNumber,
    required this.role,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
      "userName": userName,
      "FullName": fullName,
      "Gnder": gender,
      "DateOfBirth": birthDay,
      "image": image,
      "SSN": ssn,
      "Phone": phoneNumber,
      "Role": role,
    };
  }
}
