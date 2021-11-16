import 'package:appshop1/BouncyPageRoute.dart';
import 'package:appshop1/Controller/AddtocartController.dart';
import 'package:appshop1/Controller/AllproductController.dart';
import 'package:appshop1/Controller/ProductdeltailsController.dart';
import 'package:appshop1/Widget/fade_in_animation.dart';
import 'package:appshop1/Widget/side_in_animation.dart';
import 'package:appshop1/Widget/widget_search.dart';
import 'package:appshop1/Widget/wigetListProduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Product_deltails.dart';

class AllproductPage extends StatelessWidget {
  final Homeproduct allproduct = Get.put(Homeproduct());
  final ProductdeltailsController productdeltailsController =
      Get.put(ProductdeltailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar:AppBar(
          centerTitle: true,
          brightness: Brightness.dark,
          elevation: 5,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text(
            'Tất cả sản phẩm',
            style: GoogleFonts.spartan(
              textStyle: TextStyle(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.w700,
                letterSpacing: -1,
              ),
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black87,
            ),
            onPressed: () => Get.back(),
          ),
          actions: [],
        ),
        body: Column(
          children: [
            FadeInAnimation(delay: 2, child: SeachWidger()),
            Expanded(child: _buildAllProduct(context))
          ],
        ));
  }

  Widget _buildAllProduct(BuildContext context) {
    return Obx(() {
      if (allproduct.isLoading.value)
        return Center(
            child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent)));
      else
        return GridView.builder(
          shrinkWrap: true,
          itemCount: allproduct.productlist.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.7),
          ),
          itemBuilder: (context, index) {
            var data = allproduct.productlist[index];
            return SideInAnimation(
              delay: 3,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      BouncyPageRoute(
                          widget: Productdeltails(
                        product: data.productId!,
                      )));
                },
                child: ShoesCard(shoes: data),
              ),
            );
          },
        );
    });
  }

}
