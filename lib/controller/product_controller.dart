import 'package:ecommercecourse/core/constant/shared_keys.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/data/datasource/remote/home.dart';
import 'package:get/get.dart';


class ProductController extends GetxController {
  late ProductModel product;

  @override
  void onInit() {
    product = Get.arguments[SharedKeys.product];
    super.onInit();
  }
}