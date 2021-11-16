import 'package:appshop1/Page/SearchPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../BouncyPageRoute.dart';

class SeachWidger extends StatelessWidget {
  late TextEditingController textsearch;
  @override
  Widget build(BuildContext context) {
    textsearch = new TextEditingController();
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(29.5),
      ),
      child: TextField(
        style: TextStyle(
          fontSize: 14,
          color: Colors.black87,
          letterSpacing: -1,
        ),
        controller: textsearch,
        decoration: InputDecoration(
          hintStyle:    GoogleFonts.spartan(
        textStyle: TextStyle(
        fontSize: 14,
          color: Colors.redAccent,
          fontWeight: FontWeight.w700,
          letterSpacing: -1,
        ),
      ),
          hintText: "Tìm kiếm theo tên sản phẩm",
          icon: Icon(Icons.search,color: Colors.redAccent,),
          border: InputBorder.none,
        ),
        onSubmitted: (value){
          Navigator.push(context, BouncyPageRoute(widget: SearchPage(productName: value,)));
          textsearch.clear();
        },
      ),


    );
  }
}