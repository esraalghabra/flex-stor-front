import 'package:ecommercecourse/core/services/api.dart';
import 'package:ecommercecourse/linkapi.dart';

class HomeData {
  ApiService apiService;
  HomeData(this.apiService);
  getData() async {
    var response = await apiService.post(AppLink.homepage, {});
    return response.fold((l) => l, (r) => r);
  }
}
