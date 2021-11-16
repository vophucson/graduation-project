import 'package:appshop1/Controller/SearchController.dart';
import 'package:appshop1/Page/Product_deltails.dart';
import 'package:appshop1/Widget/wigetListProduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class searchView extends StatefulWidget {
  String data;
  bool isReload;
  searchView({required this.data,required this.isReload});
  @override
  State<StatefulWidget> createState() {
    return _searchView();
  }
}

class _searchView extends State<searchView> {
  SearchController searchController = Get.put(SearchController());
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await searchController.fetchSearchview(productName: this.widget.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildSearch(context),
    );
  }

  Widget _buildSearch(BuildContext context) {
    return Obx(() {
      if(searchController.isLoading.value) {
        return Center(
            child: CircularProgressIndicator(backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent)));
      }
      else
      return GridView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: searchController.productlist.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height /1.7),),
        itemBuilder: (context, index) {
          var data = searchController.productlist[index];
          return GestureDetector(
              onTap: () {
                Get.to(() => Productdeltails(
                  product: searchController.productlist[index].productId!,
                ));
              },
              child: ShoesCard(shoes: data,));
        },
      );
    });
  }
}
