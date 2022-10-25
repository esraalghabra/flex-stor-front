import 'package:ecommercecourse/core/constant/shared_keys.dart';
import 'package:ecommercecourse/core/constant/status_code_request.dart';
import 'package:ecommercecourse/core/constant/status_view.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/debug.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/services/sharedpreferences.dart';
import 'package:ecommercecourse/data/datasource/remote/home.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {

  late SharedPreferencesService sharedService;
  late String token;
  late HomeRemote homeRemote;
  late StatusView statusView;
  late List mainCategories ;
  late List products;


  @override
  void onInit() async {
    super.onInit();
    sharedService =Get.find();
    token= sharedService.sharedPreferences.getString(SharedKeys.rememberToken)!;
    homeRemote= HomeRemote(Get.find(),token);
    await home();
  }

  home() async {
    printNote('Start home Controller');
    statusView = StatusView.loading;
    update();
    var response = await homeRemote.home();
    statusView = handlingData(response);
    if (statusView == StatusView.ok) {
      if (response['status'] == StatusCodeRequest.OK) {
        mainCategories=response['data']['mainCategories'];
        products=response['data']['products'];
      }
    }
    update();
  }

  mainCategory(int i,int id,String mainCategorySelected,List mainCategories) {
    Get.toNamed(AppRoute.mainCategories, arguments: {
      SharedKeys.i: i,
      SharedKeys.passId: id,
      SharedKeys.selected: mainCategorySelected,
      SharedKeys.mainCategories: mainCategories,
    });
  }

  product(ProductModel product){
    printNote('Start product');
    Get.toNamed(AppRoute.product, arguments: {
      SharedKeys.product:product
    });
  }
}
