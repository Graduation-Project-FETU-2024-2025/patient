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
  static String getAppointments = "api/Appointments/users/";
  static String getSpecialities = "api/Specialization";
  static String getTopDoctors = "api/Doctors/top-rated";
  static String getDoctorsbySpeciality = "api/Doctors/specialization";
  static String getDoctorDetails = "api/Doctors";
  static String userHistory = "api/profile/history";
  static String orderLogs = "/api/orders";
  static String makeAppointment = "api/Appointments/create";
  static String addReview = "api/Review";
  static String createOrder = "api/orders";
  static String getAllDoctors = "api/Doctors";

  static String deleteOrderLogs(String id) => "/api/orders/$id";
  static String searchMedicine(String query) =>
      "api/Product/with-branches?page=1&pageSize=30&search=$query";
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
