import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/data/model/category_model.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeController> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.mainCategories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel: MainCategoryModel.fromJson(controller.mainCategories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<HomeController> {
  final MainCategoryModel categoriesModel;
  final int? i;
  const Categories({Key? key, required this.categoriesModel, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.mainCategory(i!, categoriesModel.id! , categoriesModel.name!,controller.mainCategories);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColor.thirdColor, borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child: SvgPicture.network(categoriesModel.photo!, color: AppColor.secondColor),
          ),
          Text(categoriesModel.name!, style: const TextStyle(fontSize: 13, color: AppColor.black),)
        ],
      ),
    );
  }
}
