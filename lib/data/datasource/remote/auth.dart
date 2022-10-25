import 'package:ecommercecourse/core/functions/debug.dart';
import 'package:ecommercecourse/core/services/api.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/cupertino.dart';

class AuthRemote
{
    ApiService apiService;
    AuthRemote(this.apiService);

    login(String email ,String password) async {
      printNote('Start login Remote');
      var response = await apiService.post(AppLink.login, {
        "email" : email ,
        "password" : password
      });
      printNote('End login Remote: $response');
      return response.fold((l) => l, (r) => r);
    }
    signup(String name ,String password,String confirmPassword ,String email ,String phone ) async {
      printNote('Start signup Remote');
      var response = await apiService.post(AppLink.signUp, {
        "name" : name ,
        "password" : password  ,
        "password confirmation" : confirmPassword  ,
        "email" : email ,
        "phone" : phone  ,
      });
      printNote('End signup Remote: $response');
      return response.fold((l) => l, (r) => r);
    }
    sendVerifyCode(String email) async {
      printNote('Start sendVerifyCode Remote');
      var response = await apiService.post(AppLink.sendVerifyCode, {"email" : email,});
      printNote('End sendVerifyCode Remote: $response');
      return response.fold((l) => l, (r) => r);
    }
    verifyCode(String email ,String password ,String verifyCode) async {
      printNote('Start verifyCode Remote');
      var response = await apiService.post(AppLink.verifyCode, {
        "email" : email ,
        "password" : password ,
        "verifyCode" : verifyCode
      });
      printNote('End verifyCode Remote: $response');
      return response.fold((l) => l, (r) => r);
    }
    resetPassword(String email ,String password,String confirmPassword) async {
      printNote('Start resetPassword Remote');
      var response = await apiService.post(AppLink.resetPassword, {
        "email" : email ,
        "password" : password,
        "password confirmation" : password
      });
      printNote('End resetPassword Remote: $response');

      return response.fold((l) => l, (r) => r);
    }
}
