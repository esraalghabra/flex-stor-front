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

class LoginController extends GetxController {

  late GlobalKey<FormState> formKey;
  late AuthRemote authRemote;
  late SharedPreferencesService sharedService;
  late StatusView statusView;
  late TextEditingController email;
  late TextEditingController password;
  late bool isHidePassword;

  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();
    authRemote = AuthRemote(Get.find());
    sharedService = Get.find();
    email = TextEditingController();
    password = TextEditingController();
    statusView = StatusView.none;
    isHidePassword = true;
  }

  login() async {
    printNote('Start login Controller');
    if (formKey.currentState!.validate()) {
      printNote('login Controller FrontEnd INVALIDATION success');
      statusView = StatusView.loading;
      update();
      var response = await authRemote.login(email.text, password.text);
      statusView = handlingData(response);
      if (statusView == StatusView.ok){
        if (response['status'] == StatusCodeRequest.OK) {
          sharedService.sharedPreferences.setString(SharedKeys.name, response['data']['name']) ;
          sharedService.sharedPreferences.setString(SharedKeys.email, response['data']['email']) ;
          sharedService.sharedPreferences.setString(SharedKeys.rememberToken, response['data']['remember_token']);
          sharedService.sharedPreferences.setBool(SharedKeys.isAuthenticated,true);
          Get.offNamed(AppRoute.success);
        } else if(response['status'] == StatusCodeRequest.BAD_REQUEST) {
          password.text='';
          Get.defaultDialog(title: "ُWarning", middleText: "Email Or Password Not Correct");
        }
      }
      update();
    } else {
      Get.defaultDialog(title: "ُWarning", middleText: "Email Or Password Not valid");
    }
  }

  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
  showPassword() {
    isHidePassword = isHidePassword == true ? false : true;
    update();
  }
}
