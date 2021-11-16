import 'package:appshop1/Controller/AddtocartController.dart';
import 'package:appshop1/Widget/fade_in_animation.dart';
import 'package:appshop1/Widget/side_in_animation.dart';
import 'package:appshop1/Widget/widget_searchview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  SearchPage({required this.productName});
  String productName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.dark,
        elevation: 5,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Tìm kếm sản phẩm',
          style: GoogleFonts.spartan(
            textStyle: TextStyle(
              fontSize: 18,
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
      body: FadeInAnimation(
        delay: 1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Kết quả tình kiếm của " + "'" + "$productName" + "'",
                style: GoogleFonts.spartan(
                  textStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SideInAnimation(
                  delay: 2,
                  child: searchView(
                    data: productName,
                    isReload: true,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
