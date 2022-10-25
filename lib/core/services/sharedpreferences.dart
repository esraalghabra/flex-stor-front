import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService extends GetxService {
  
  late SharedPreferences sharedPreferences;

  Future<SharedPreferencesService> init() async {
    await Firebase.initializeApp();
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }


}

initialServices() async {
  await Get.putAsync(() => SharedPreferencesService().init());
}
