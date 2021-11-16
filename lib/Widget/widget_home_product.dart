import 'package:appshop1/BouncyPageRoute.dart';
import 'package:appshop1/Controller/AllproductController.dart';
import 'package:appshop1/Page/AllproductPage.dart';
import 'package:appshop1/Page/Product_deltails.dart';
import 'package:appshop1/Widget/fade_in_animation.dart';
import 'package:appshop1/Widget/side_in_animation.dart';
import 'package:appshop1/Widget/wigetListProduct.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetAllProduct extends StatelessWidget {
  final Homeproduct homeallproduct = Get.put(Homeproduct());
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: FadeInAnimation(
          delay: 4,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 3),
                    child: Text(
                      'Tất cả sản phẩm',
                      style: GoogleFonts.spartan(
                        textStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 4, right: 20),
                    child: RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(context,
                                BouncyPageRoute(widget: AllproductPage()));
                          },
                        text: 'Xem tất cả',
                        style: GoogleFonts.spartan(
                          textStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -1,
                          ),
                        ),
                      )
                    ])),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              _buildAllProduct(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAllProduct(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 1.6,
      alignment: Alignment.centerLeft,
      child: Obx(
        () {
          if (homeallproduct.isLoading.value) {
            return Center(
                child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.redAccent)));
          } else
            return ListView.builder(
              itemCount: homeallproduct.productlist.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var shoes = homeallproduct.productlist[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        BouncyPageRoute(
                            widget: Productdeltails(
                          product: shoes.productId!,
                        )));
                  },
                  child: ShoesCard(shoes: shoes),
                );
              },
            );
        },
      ),
    );
  }
}
