class ResetPasswordRequestModel {
final String email;
final String newPassword;
final String confirmPassword;
final String token;
  ResetPasswordRequestModel({
    required this.email,
    required this.newPassword,
    required this.confirmPassword,
    required this.token,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': newPassword,
      'confirmPasswrod': confirmPassword,
      'token': token,
    };
  }

}