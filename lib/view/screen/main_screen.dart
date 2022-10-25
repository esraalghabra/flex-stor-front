import 'package:ecommercecourse/controller/main_screen_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainScreenControllerImp());
    return GetBuilder<MainScreenControllerImp>(
        builder: (controller) => Scaffold(
            appBar: AppBar(
              title: const Text('Flex Store'),
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
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColor.primaryColor,
                onPressed: () {},
                child: const Icon(Icons.shopping_basket_outlined)),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const CustomBottomAppBarHome(),
            body: controller.listPage.elementAt(controller.currentpage),
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

