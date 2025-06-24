class EndPoints {
  // base url
  static String baseUrl = "https://afiyatuk.runasp.net/";

  // endpoints

  //auth
  static String login = "api/auth/user/login";
  static String register = "api/Auth/register";
  static String getOtp = "api/Auth/get-otp";
  static String verifyOtp = "api/auth/forgot-password";
  static String resetPassword = "api/Auth/change-password";
  static String getProfile = "api/profile";
}

class ApiKeys {
  static String status = "status";
  static String eMessage = "ErrorMessage";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String id = "id";
  static String message = "message";
  static String name = "name";
  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profilePic";
  static String type = "type";
  static String coordinates = "coordinates";
  static String favorites = "favorites";
  static String createdAt = "createdAt";
  static String user = "user";
  static String lang = "lang";
}
