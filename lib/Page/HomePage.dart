import 'package:appshop1/Controller/AddtocartController.dart';
import 'package:appshop1/Controller/ProfileController.dart';
import 'package:appshop1/Page/CartPage.dart';
import 'package:appshop1/Page/UserPage.dart';
import 'package:appshop1/Widget/fade_in_animation.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DashboardPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePages();
  }
}

class HomePages extends State<HomePage> {
  ProfileController profileController = Get.put(ProfileController());
  @override
  void initState() {
    super.initState();
  }

  List<Widget> _widgetList = [
    DashboardPage(),
    CartPages(),
    DashboardPage(),
    UserPages(),
  ];
  int _index = 0;
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
          'Life Kicks',
          style: GoogleFonts.spartan(
            textStyle: TextStyle(
              fontSize: 20,
              color: Colors.black87,
              fontWeight: FontWeight.w700,
              letterSpacing: -1,
            ),
          ),
        ),
        actions: [
        ],
      ),
      bottomNavigationBar: FadeInAnimation(
        delay: 1,
        child: BottomNavyBar(
          backgroundColor: Colors.white,
          //   color: Colors.white,
          items: [
            BottomNavyBarItem(
                icon: Icon(Icons.home,color: Colors.redAccent,),
                title: Text(
                  "Trang chính",
                  style: GoogleFonts.spartan(
                    textStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
               //       fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                    ),
                  ),
                ),
                activeColor: Colors.grey),
            BottomNavyBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.redAccent,
                ),
                title: Text(
                  "Giỏi hàng",
                  style: GoogleFonts.spartan(
                    textStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
               //       fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                    ),
                  ),
                ),
                activeColor: Colors.grey),
            BottomNavyBarItem(
                icon: Icon(Icons.notifications_rounded,color: Colors.redAccent,),
                title: Text(
                  "Thông báo",
                  style: GoogleFonts.spartan(
                    textStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                //      fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                    ),
                  ),
                ),
                activeColor: Colors.grey),
            BottomNavyBarItem(
                icon: Icon(Icons.supervised_user_circle_sharp ,color: Colors.redAccent,),
                title: Text(
                  "Người dùng",
                  style: GoogleFonts.spartan(
                    textStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
              //        fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                    ),
                  ),
                ),
                activeColor: Colors.grey),
          ],
          selectedIndex: _index,
          onItemSelected: (index) {
            setState(() {
              _index = index;
            });
          },
        ),
      ),
      body: _widgetList[_index],
    );
  }


}
