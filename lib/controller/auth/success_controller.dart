import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:get/get.dart';


class SuccessSignUpController extends GetxController {
  goToPageLogin() {
    Get.offAllNamed(AppRoute.home);
  }
}
