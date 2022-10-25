import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/constant/shared_keys.dart';
import 'package:ecommercecourse/core/services/sharedpreferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  SharedPreferencesService myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getBool(SharedKeys.isAuthenticated) == true) {
      return const RouteSettings(name: AppRoute.home);
    }
    if (myServices.sharedPreferences.getBool(SharedKeys.isPassOnBoarding) == true) {
      return const RouteSettings(name: AppRoute.login);
    }
    return null;
  }
}
