import 'package:appshop1/BouncyPageRoute.dart';
import 'package:appshop1/Page/HomePage.dart';
import 'package:appshop1/Page/LoginPage.dart';
import 'package:appshop1/Page/RegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class LockScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TitleWidget(icon: Icons.lock_outline_rounded, text: 'BẠN CHƯA ĐĂNG NHẬP VUI LÒNG ĐĂNG NHẬP ĐỂ SỬ DỤNG CHỨC NĂNG NÀY'),
            SizedBox(height: 30,),
            SizedBox(
              height: 50,
              width: 250,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(15)),
                color: Colors.redAccent,
                onPressed: () {
                  Navigator.push(context, BouncyPageRoute(widget: LoginPage()));
                },
                child: Text(
                  "Đăng nhập",
                  style: GoogleFonts.spartan(
                    textStyle: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            SizedBox(
              height: 50,
              width: 250,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(15)),
                color: Colors.redAccent,
                onPressed: () {
                  Navigator.push(context, BouncyPageRoute(widget: RegisterPage()));
                },
                child: Text(
                  "Đăng ký",
                  style: GoogleFonts.spartan(
                    textStyle: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class TitleWidget extends StatelessWidget {
  final IconData? icon;
  final String? text;

  const TitleWidget({
    @required this.icon,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Icon(icon, size: 200,color: Colors.redAccent,),
      const SizedBox(height: 16),
      Text(
        text!,
        style: GoogleFonts.spartan(
          textStyle: TextStyle(
            fontSize: 20,
            color: Colors.black87,
            fontWeight: FontWeight.w700,
            letterSpacing: -1,
          ),
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );
}
