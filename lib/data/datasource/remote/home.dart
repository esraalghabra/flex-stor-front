import 'package:ecommercecourse/core/functions/debug.dart';
import 'package:ecommercecourse/core/services/api.dart';
import 'package:ecommercecourse/linkapi.dart';

class HomeRemote
{
  ApiService apiService;
  String token;
  HomeRemote(this.apiService,this.token);

  home() async {
    printNote('Start home Remote');
    var response = await apiService.get(AppLink.home, {
      'Authorization': 'Bearer $token',
    });
    printNote('End home Remote: $response');
    return response.fold((l) => l, (r) => r);
  }
  mainCategories() async {
    printNote('Start mainCategories Remote');
    var response = await apiService.get(AppLink.mainCategories, {
      'Authorization': 'Bearer $token',
    });
    printNote('End mainCategories Remote: $response');
    return response.fold((l) => l, (r) => r);
  }
  mainCategory(int id) async {
    printNote('Start mainCategory Remote');
    var response = await apiService.get(AppLink.mainCategory+id.toString(), {
      'Authorization': 'Bearer $token',
    });
    printNote('End mainCategory Remote: $response');
    return response.fold((l) => l, (r) => r);
  }
  subCategory(int id) async {
    printNote('Start subCategory Remote');
    var response = await apiService.get(AppLink.subCategory+id.toString(), {
      'Authorization': 'Bearer $token',
    });
    printNote('End subCategory Remote: $response');
    return response.fold((l) => l, (r) => r);
  }
  products() async {
    printNote('Start products Remote');
    var response = await apiService.get(AppLink.products, {
      'Authorization': 'Bearer $token',
    });
    printNote('End products Remote: $response');
    return response.fold((l) => l, (r) => r);
  }
  product(int id) async {
    printNote('Start sendVerifyCode Remote');
    var response = await apiService.get(AppLink.product+id.toString(), {
      'Authorization': 'Bearer $token',
    });
    printNote('End sendVerifyCode Remote: $response');
    return response.fold((l) => l, (r) => r);
  }
}
