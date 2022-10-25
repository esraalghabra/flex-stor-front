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

class SignUpController extends GetxController {

  late GlobalKey<FormState> formKey;
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  late StatusView statusView;
  late AuthRemote authRemote;
  late SharedPreferencesService sharedService;

  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();
    name = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    statusView = StatusView.none;
    authRemote = AuthRemote(Get.find());
    sharedService = Get.find();
  }

  signUp() async {
    printNote('Start signup Controller');
    if (formKey.currentState!.validate()) {
      printNote('signup Controller FrontEnd INVALIDATION success');
      statusView = StatusView.loading;
      update();
      var response = await authRemote.signup(name.text, password.text,confirmPassword.text, email.text, phone.text);
      statusView = handlingData(response);
      if (statusView == StatusView.ok) {
        if (response['status'] == StatusCodeRequest.OK) {
          Get.offNamed(AppRoute.verifyCode,arguments: {"email" : email.text,"password" : password.text});
        } else if (response['status'] == StatusCodeRequest.BAD_REQUEST){
          Get.defaultDialog(title: "ُWarning" , middleText:'the data not valid') ;
        }
      }
      update();
    } else {
      printNote('signup Controller FrontEnd INVALIDATION Error');
      Get.defaultDialog(title: "ُWarning" , middleText: "The data is invalid") ;
    }
  }

  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }
}
