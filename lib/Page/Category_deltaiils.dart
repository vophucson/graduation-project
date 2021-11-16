import 'package:appshop1/Controller/AddtocartController.dart';
import 'package:appshop1/Widget/widget_categoriesdeltails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Categorydeltails extends StatefulWidget {
  Categorydeltails({ required this.category});
  int category;

  @override
  State<StatefulWidget> createState() {
    return _Categorydeltails();
  }
}

class _Categorydeltails extends State<Categorydeltails> {
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
          'Sản phẩm theo thương hiệu',
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
      body: categoriesDeltails(
        data: this.widget.category,
        isReload: true,
      ),
    );
  }
}
