import 'package:ecommercecourse/core/services/api.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Start 
    Get.put(ApiService()) ;
  }
}
