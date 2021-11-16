import 'package:appshop1/BouncyPageRoute.dart';
import 'package:appshop1/Controller/CategorydeltailsController.dart';
import 'package:appshop1/Widget/fade_in_animation.dart';
import 'package:appshop1/Widget/side_in_animation.dart';
import 'package:appshop1/Widget/widget_search.dart';
import 'package:appshop1/Widget/wigetListProduct.dart';
import 'package:flutter/material.dart';
import 'package:appshop1/Page/Product_deltails.dart';
import 'package:get/get.dart';

class categoriesDeltails extends StatefulWidget {
  int data;
  bool isReload;
  categoriesDeltails({required this.data,required this.isReload});
  @override
  State<StatefulWidget> createState() {
    return _categoriesDeltails();
  }
}

class _categoriesDeltails extends State<categoriesDeltails> {
  CategorydeltailsController categorydeltailsController =
      Get.put(CategorydeltailsController());
  @override
  void initState() {
    super.initState();
    if(this.widget.isReload) {
      Future.delayed(Duration.zero, () async {
        await categorydeltailsController.fetchCategorytview(categoryId: this.widget.data);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [FadeInAnimation(delay: 2,child: SeachWidger()), Expanded(child:  _buildCategoryProduct(context))],
      ),
    );
  }

  Widget _buildCategoryProduct(BuildContext context) {
    return Obx(() {
      if(categorydeltailsController.isLoading.value)
        return Center(child: CircularProgressIndicator( backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent)));
      else
      return Container(
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: categorydeltailsController.productlist.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height /1.7),),

          itemBuilder: (context, index) {
            var data = categorydeltailsController.productlist[index];
            return SideInAnimation(
              delay: 3,
              child: Container(
                height: 700,
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, BouncyPageRoute(widget: Productdeltails(product: data.productId!,)));
                    },
                    child: ShoesCard(shoes: data,)),
              ),
            );
          },
        ),
      );
    });
  }
}
