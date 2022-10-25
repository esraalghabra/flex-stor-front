import 'package:ecommercecourse/core/constant/shared_keys.dart';
import 'package:ecommercecourse/core/constant/status_code_request.dart';
import 'package:ecommercecourse/core/constant/status_view.dart';
import 'package:ecommercecourse/core/functions/debug.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/services/sharedpreferences.dart';
import 'package:ecommercecourse/data/datasource/remote/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';


class MainCategoriesController extends GetxController with GetSingleTickerProviderStateMixin {

  late SharedPreferencesService sharedService;
  late HomeRemote homeRemote;
  late int i;
  late int categoryId;
  late String token;
  late StatusView statusView;
  late StatusView productStatusView;
  late bool floatIsVisible=true;
  ItemScrollController itemScrollController=ItemScrollController();
  List? mainCategories ;
  List? products;
  Map? category ;



  @override
  void onInit() async{
    super.onInit();
    mainCategories = Get.arguments[SharedKeys.mainCategories];
    i = Get.arguments[SharedKeys.i];
    categoryId = Get.arguments[SharedKeys.passId];
    sharedService = Get.find();
    token=sharedService.sharedPreferences.getString(SharedKeys.rememberToken)!;
    printNote(token);
    homeRemote=HomeRemote(Get.find(),token);
    statusView=StatusView.none;
    productStatusView=StatusView.none;
    await mainCategory(categoryId);
  }

  notificationFloatButton(UserScrollNotification notification) {
    if(notification.direction==ScrollDirection.forward) {
      floatIsVisible=true;
    }else if(notification.direction==ScrollDirection.reverse){
      floatIsVisible=false;
    }
    update();
    return true;
  }

  changeCat(int i,int categoryId) async{
    itemScrollController.scrollTo(index:category!.length-i, duration: const Duration(milliseconds:200));
    this.categoryId = categoryId;
    printNote('Start signup Controller');
    productStatusView = StatusView.loading;
    update();
    var response = await homeRemote.mainCategory(categoryId);
    productStatusView = handlingData(response);
    if (productStatusView == StatusView.ok) {
      if (response['status'] == StatusCodeRequest.OK) {
        printNote('Start signup success');
        category=response['data'];
        products=response['data']['products'];
        if(products!.isEmpty) {
          productStatusView=StatusView.noContent;
          update();
        }
      }
    }
    update();
  }

  mainCategory(id) async {
    printNote('Start signup Controller');
    statusView = StatusView.loading;
    update();
    var response = await homeRemote.mainCategory(id);
    statusView = handlingData(response);
    if (statusView == StatusView.ok) {
      if (response['status'] == StatusCodeRequest.OK) {
        printNote('Start signup success');
        category=response['data'];
        products=response['data']['products'];
        if(products!.isEmpty) {
          productStatusView=StatusView.noContent;
          update();
        }
      }
    }
    update();
  }
}
