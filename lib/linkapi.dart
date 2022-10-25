class AppLink {

  static const String server = "10.0.2.2:8000";
  // static const String server = "127.0.0.1:8000";

  // ================================= Auth ========================== //
  static const String signUp = "/api/register";
  static const String login = "/api/login";
  static const String logout = "/api/logout";
  static const String sendVerifyCode = "/api/send-verify-code";
  static const String verifyCode = "/api/verify-code";
  static const String resetPassword = "/api/reset-password";
  static const String forgetPassword = "/api/forget-password";

  // ================================= Home ========================== //
  static const String homepage = "/api/mainCategory"  ;
  static const String items = "/api/products"  ;

  static const String home = "/api/home"  ;
  static const String mainCategories = "/api/main-categories"  ;
  static const String mainCategory = "/api/main-category/"  ;
  static const String subCategory = "/api/sub-category/"  ;
  static const String products = "/api/products"  ;
  static const String product = "/api/products/"  ;

}
