import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/main_categories_controller.dart';
import 'package:ecommercecourse/view/widget/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:ecommercecourse/view/widget/customappbar.dart';
import 'package:ecommercecourse/view/widget/home/listcategorieshome.dart';
import 'package:ecommercecourse/view/widget/items/customlistitems.dart';
import 'package:ecommercecourse/view/widget/items/listcategoirseitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainCategories extends StatelessWidget {
  const MainCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainCategoriesController());

    return GetBuilder<MainCategoriesController>(
          builder: (controller) => Scaffold(
            floatingActionButton: Visibility(
              visible: controller.floatIsVisible,
              child: FloatingActionButton(
                onPressed: () {  },
                backgroundColor: AppColor.primaryColor,
                child: const Icon(Icons.add),
              ),),
            body: HandlingDataView(
                statusView: controller.statusView,
                widget: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) =>[
                    SliverAppBar(
                      floating: true,
                      snap: true,
                      title: const Text("Main Categories "),
                      backgroundColor: AppColor.primaryColor,
                      centerTitle: true,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
                      actions: [
                        IconButton(
                            onPressed: (){},
                            icon:const Icon(Icons.notifications_active_outlined)
                        ),
                        IconButton(
                            onPressed: (){},
                            icon:const Icon(Icons.shopping_cart)
                        ),
                      ],
                      leading:IconButton(
                          onPressed: (){
                            showSearch(context: context, delegate: SearchData());
                          },
                          icon:const Icon(Icons.search)
                      ),
                    )
                  ],
                  body: NotificationListener<UserScrollNotification>(
                    onNotification: ((notification) {
                      return controller.notificationFloatButton(notification);
                    }),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ListView(children: [
                        const SizedBox(height: 0),
                        const ListCategoriesItems(),
                        GetBuilder<MainCategoriesController>(
                          builder: (controller)=>HandlingDataRequest(
                              statusView: controller.productStatusView,
                              widget: GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:(controller.products==null) ? 0 : controller.products!.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7),
                                  itemBuilder: (BuildContext context, index) {
                                    return CustomListItems(product: ProductModel.fromJson(controller.products![index]));
                                  })),
                        )
                      ]),
                    ),
                  ),
                )
            ),
          ));
  }
}
class SearchData extends SearchDelegate{
  List<String> names=[
    'osama',
    'mohamed',
    'Khaled',
    'Omar',
    'Hossein',
    'Husam',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: (){query='';},
          icon:const Icon(Icons.close)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){close(context, null);},
        icon:const Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
          color: Colors.brown,
          height: 300,
          width: 200,
          alignment: Alignment.center,
          child: Text(query ,style: const TextStyle(fontSize:30,fontWeight: FontWeight.bold),)
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List filter= names.where((element) => element.contains(query)).toList();
    filter=query.isEmpty ? names : filter;
    return ListView(
      children: List.generate(filter.length,
              (index) => ListTile(
            leading: const Icon(Icons.person),
            title: Text(filter[index]),
            onTap: (){
              query=filter[index];
              showResults(context);
            },
          )
      ),
    );
  }

}




