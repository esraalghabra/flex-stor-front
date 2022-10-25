import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/controller/main_categories_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:ecommercecourse/data/model/category_model.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ListCategoriesItems extends GetView<MainCategoriesController> implements  PreferredSizeWidget {
  const ListCategoriesItems({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ScrollablePositionedList.separated(
        itemScrollController: controller.itemScrollController,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: (controller.mainCategories==null)? 0 : controller.mainCategories!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel: MainCategoryModel.fromJson(controller.mainCategories![index]),
          );
        },
      )
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class Categories extends GetView<MainCategoriesController> {
  final MainCategoryModel categoriesModel;
  final int i;

  const Categories({Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(i, categoriesModel.id!);
      },
      child: Column(
        children: [
          GetBuilder<MainCategoriesController>(
              builder: (controller) => Container(
                  padding: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
                  decoration: controller.categoryId == categoriesModel.id
                      ? const BoxDecoration(
                          border: Border(bottom: BorderSide(width: 3, color: AppColor.primaryColor)))
                      : null,
                  child: Text(categoriesModel.name!,style:const TextStyle(fontSize: 20, color: AppColor.grey2),
              ),
            )),
        ],
      ),
    );
  }
}
