import 'package:ecommercecourse/core/constant/shared_keys.dart';
import 'package:ecommercecourse/core/constant/status_code_request.dart';
import 'package:ecommercecourse/core/constant/status_view.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/debug.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/services/sharedpreferences.dart';
import 'package:ecommercecourse/data/datasource/remote/auth.dart';
import 'package:get/get.dart';

class VerifyCodeController extends GetxController {

  late AuthRemote authRemote;
  late SharedPreferencesService sharedService;
  late StatusView statusView;
  late String email;
  late String password;

  @override
  void onInit() {
    super.onInit();
    authRemote = AuthRemote(Get.find());
    sharedService = Get.find();
    statusView = StatusView.none;
    email = Get.arguments['email'];
    password = Get.arguments['password'];
    sendVerifyCode();
  }

  sendVerifyCode() async {
    printNote('Start sendVerifyCode Controller');
    statusView = StatusView.loading;
    update();
    var response = await authRemote.sendVerifyCode(email);
    statusView = handlingData(response);
    if (statusView == StatusView.ok) {
      if (response['status'] == StatusCodeRequest.OK) {
        printNote('sendVerifyCode Controller SUCCESS');
      } else if (response['status'] == StatusCodeRequest.BAD_REQUEST){
        // Get.back(result: 'the data not valid'); // TODO Back Result
        Get.defaultDialog(title: "ُWarning" , middleText:'the data not valid') ;
      }
    }
    update();
  }
  verifyCode(verifyCode) async {
    printNote('Start verifyCode Controller');
    statusView = StatusView.loading;
    update();
    var response = await authRemote.verifyCode(email,password, verifyCode);
    statusView = handlingData(response);
    if (statusView == StatusView.ok) {
      if (response['status'] == StatusCodeRequest.OK) {
        printNote('verifyCode Controller SUCCESS');
        if(password==SharedKeys.defaultPassword) {
          Get.offNamed(AppRoute.resetPassword,arguments: {SharedKeys.email:email});
        }else {
          sharedService.sharedPreferences.setString(SharedKeys.name, response['data']['name']) ;
          sharedService.sharedPreferences.setString(SharedKeys.email, response['data']['email']) ;
          sharedService.sharedPreferences.setString(SharedKeys.rememberToken, response['data']['remember_token']);
          sharedService.sharedPreferences.setBool(SharedKeys.isAuthenticated,true);
          Get.offNamed(AppRoute.success);
        }
      } else if (response['status'] == StatusCodeRequest.BAD_REQUEST){
        Get.defaultDialog(title: "ُWarning" , middleText:'the verify Code not valid') ;
      }
    }
    update();
  }

}
