import 'package:flutter/material.dart';
import 'package:appshop1/Model/Product_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
class ShoesCard extends StatelessWidget {
  final ProductDetail shoes;
  ShoesCard({required this.shoes});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white30,
      elevation: 0,
      margin: EdgeInsets.only(right: 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 8),
        child: Column(
          children: [
            Container(
              width: 180.0,
              height: 140.0,
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(
                top: 12,
                right: 12,
              ),
              decoration: BoxDecoration(
               color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: NetworkImage(shoes.imageUrl.toString()),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SizedBox(height: 5,),
            Text(
              shoes.categoryName!,
              style: GoogleFonts.spartan(
                textStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  letterSpacing: -1,
                ),
              ),
            ),
            SizedBox(height: 5,),
            Container(
              width: 120,
              child: Center(
                child: Text(
                  shoes.productName!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.spartan(
                    textStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "Giá: ${shoes.productPrice.toVND(unit: 'VNĐ')}",
              style: GoogleFonts.spartan(
                textStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}