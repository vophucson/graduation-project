import 'package:appshop1/Controller/AllcategoryController.dart';
import 'package:appshop1/Page/Category_deltaiils.dart';
import 'package:appshop1/Widget/fade_in_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../BouncyPageRoute.dart';

class WidgetCategories extends StatelessWidget {
  final Homecategory homecategory = Get.put(Homecategory());

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      delay: 3,
      child: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 10, top: 3),
                      child: Text(
                        'Các thương hiệu',
                        style: GoogleFonts.spartan(
                          textStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -1,
                          ),
                        ),
                      ))
                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(10),
                child: _buildCategoryList(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList(BuildContext context) {
    return Container(
      height: 120,
      alignment: Alignment.centerLeft,
      child: Obx(() {
        if (homecategory.isLoading.value)
          return Center(
              child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent)));
        else
          return ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: homecategory.categorieslist.length,
            itemBuilder: (context, index) {
              var data = homecategory.categorieslist[index];
              return GestureDetector(
                  onTap: () {
                    Navigator.push(context, BouncyPageRoute(widget: Categorydeltails(category: data.categoryId!,)));
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        width: 70,
                        height: 70,
                        alignment: Alignment.center,
                        child: Image(
                            image:  NetworkImage(data.categoryImage.toString())
                               ,fit: BoxFit.scaleDown,),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 5),
                                  blurRadius: 15)
                            ]),
                      ),
                      Row(
                        children: [
                          Text(
                            data.categoryName.toString(),
                            style: GoogleFonts.spartan(
                              textStyle: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -1,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ));
            },
          );
      }),
    );
  }
}
