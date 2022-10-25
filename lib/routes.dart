import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/middleware/mymiddleware.dart'; 
import 'package:ecommercecourse/view/screen/auth/forget_password.dart';
import 'package:ecommercecourse/view/screen/auth/login.dart';
import 'package:ecommercecourse/view/screen/auth/reset_password.dart';
import 'package:ecommercecourse/view/screen/auth/signup.dart';
import 'package:ecommercecourse/view/screen/main_screen.dart';
import 'package:ecommercecourse/view/screen/main_categories.dart';
import 'package:ecommercecourse/view/screen/language.dart';
import 'package:ecommercecourse/view/screen/onboarding.dart';
import 'package:ecommercecourse/view/screen/product.dart';
import 'package:get/get.dart';

import 'view/screen/auth/success.dart';
import 'view/screen/auth/verifycode.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(  name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),

//  Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.success, page: () => const Success()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  //
  GetPage(name: AppRoute.home, page: () => const MainScreen()),
  GetPage(name: AppRoute.mainCategories, page: () => const MainCategories()),
  GetPage(name: AppRoute.product, page: () => const Product()),


];
