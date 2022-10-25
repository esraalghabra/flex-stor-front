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

class ForgetPasswordController extends GetxController {
  
  late GlobalKey<FormState> formKey;
  late AuthRemote authRemote;
  late SharedPreferencesService sharedService;
  late TextEditingController email;
  late StatusView statusView;

  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();
    authRemote = AuthRemote(Get.find());
    sharedService = Get.find();
    email = TextEditingController();
    statusView = StatusView.none;
  }

  checkEmail() async {
    printNote('Start checkEmail Controller');
    if (formKey.currentState!.validate()){
      printNote('checkEmail Controller FrontEnd INVALIDATION success');
      Get.offNamed(AppRoute.verifyCode,arguments: {"email" : email.text,"password":SharedKeys.defaultPassword});
    }else {
      printNote('checkEmail Controller FrontEnd INVALIDATION Error');
      Get.defaultDialog(title: "ُWarning" , middleText: "The Email is invalid") ;
    }
  }
}
