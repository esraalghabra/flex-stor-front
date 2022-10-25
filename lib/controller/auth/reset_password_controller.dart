import 'package:ecommercecourse/core/constant/shared_keys.dart';
import 'package:ecommercecourse/core/constant/status_code_request.dart';
import 'package:ecommercecourse/core/constant/status_view.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/debug.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/services/sharedpreferences.dart';
import 'package:ecommercecourse/data/datasource/remote/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {

  late GlobalKey<FormState> formKey;
  late AuthRemote authRemote;
  late StatusView statusView;
  late SharedPreferencesService sharedService;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  late String email;

  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();
    authRemote = AuthRemote(Get.find());
    sharedService = Get.find();password = TextEditingController();
    confirmPassword = TextEditingController();
    email = Get.arguments[SharedKeys.email];
    statusView = StatusView.none;
  }

  resetPassword() async {
    printNote('Start resetPassword Controller');
    if (password.text != confirmPassword.text) {
      return Get.defaultDialog(title: "warning", middleText: "Password Not Match");
    }
    if (formKey.currentState!.validate()) {
      printNote('resetPassword Controller FrontEnd INVALIDATION success');
      statusView = StatusView.loading;
      update();
      var response = await authRemote.resetPassword(email, password.text,confirmPassword.text);
      statusView = handlingData(response);
      if (statusView == StatusView.ok) {
        if (response['status'] == StatusCodeRequest.OK) {
          printNote('resetPassword Controller response success');
          sharedService.sharedPreferences.setString(SharedKeys.name, response['data']['name']) ;
          sharedService.sharedPreferences.setString(SharedKeys.email, response['data']['email']) ;
          sharedService.sharedPreferences.setString(SharedKeys.rememberToken, response['data']['remember_token']);
          sharedService.sharedPreferences.setBool(SharedKeys.isAuthenticated,true);
          Get.offNamed(AppRoute.success);
        } else if (response['status'] == StatusCodeRequest.BAD_REQUEST) {
          Get.defaultDialog(title: "ُWarning", middleText: response['message']);
        }
      }
      update();
    } else {
      printNote('signup Controller FrontEnd INVALIDATION Error');
      Get.defaultDialog(title: "ُWarning" , middleText: "The data is invalid") ;
    }
  }

}
