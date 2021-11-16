
import 'package:appshop1/BouncyPageRoute.dart';
import 'package:appshop1/Page/shipperOderPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Về chúng tôi',
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Card(
                elevation: 4,
                child: Container(
                  height: 55,
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context,
                          BouncyPageRoute(widget: ShipOrder()));
                    },
                    leading: Icon(
                      Icons.run_circle,
                      color: Colors.redAccent,
                    ),
                    title: Text(
                      "Shipper",
                      style: GoogleFonts.spartan(
                        textStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}
