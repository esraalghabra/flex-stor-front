import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/view/widget/handlingdataview.dart';
import 'package:ecommercecourse/view/widget/home/customcardhome.dart';
import 'package:ecommercecourse/view/widget/home/customtitlehome.dart';
import 'package:ecommercecourse/view/widget/home/listcategorieshome.dart';
import 'package:ecommercecourse/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(
        builder: (controller) => HandlingDataView(
            statusView: controller.statusView,
            widget: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  children: const [
                    CustomCardHome(title: "A summer surprise", body: "Cashback 20%"), // TODO
                    CustomTitleHome(title: "Categories"),
                    ListCategoriesHome(),
                    CustomTitleHome(title: "Product for you"),
                    ListItemsHome(),
                    // const CustomTitleHome(title: "Offer"),
                    // const ListItemsHome()
                  ],
                ))));
  }
}
