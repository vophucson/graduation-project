import 'package:appshop1/Controller/AddtocartController.dart';
import 'package:flutter/material.dart';
import 'package:appshop1/Widget/widget_home_productdeltails.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Productdeltails extends StatefulWidget {
  Productdeltails({required this.product});
  int product;

  @override
  State<StatefulWidget> createState() {
    return _Productdeltails();
  }
}

class _Productdeltails extends State<Productdeltails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.dark,
        elevation: 5,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Chi tiết sản phẩm',
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
      body: homeProductdeltails(
        data: this.widget.product,
        isReload: true,
      ),
      backgroundColor: Colors.white,
    );
  }
}
