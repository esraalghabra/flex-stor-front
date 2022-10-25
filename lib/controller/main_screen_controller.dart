import 'package:ecommercecourse/view/screen/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainScreenControllerImp extends GetxController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("Settings"))],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("Profile"))],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("Favorite"))],
    )
  ];

  List  titlebottomappbar = [
    "home" , 
    "settings" , 
    "profile" , 
    "favorite"
  ] ; 

  changePage(int i) {
    currentpage = i;
    update();
  }
}
