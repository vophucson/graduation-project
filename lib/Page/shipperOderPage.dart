import 'package:appshop1/Controller/shipperOrderController.dart';
import 'package:appshop1/Page/shipperOrderDetailPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';

import '../BouncyPageRoute.dart';

class ShipOrder extends GetWidget<ShipperOrderController> {
  ShipperOrderController shipperOrderController =
      Get.put(ShipperOrderController());
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      await shipperOrderController.getShipperOrder();
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.dark,
        elevation: 5,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Đơn hàng được giao',
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
      body: Center(
        child: Container(
          child: Obx(() {
            if (shipperOrderController.isLoading.value)
              return Center(
                  child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.redAccent)));
            else
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: shipperOrderController.orderList.length,
                    itemBuilder: (context, index) {
                      var data = shipperOrderController.orderList[index];
                      return Card(
                        elevation: 4,
                        shadowColor: Colors.black87,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                BouncyPageRoute(
                                    widget: ShipperOrderDetail(
                                  orderId: data.orderId!,
                                )));
                          },
                          leading: data.userimage == null ? CircleAvatar(
                            radius: 30,
                            backgroundImage:  AssetImage("assets/no_avatar.jpg"),
                            backgroundColor: Colors.grey,
                          ): CircleAvatar(
                            radius: 30,
                            backgroundImage:  NetworkImage(data.userimage!),
                            backgroundColor: Colors.grey,
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('Ngày giao hàng: ${data.expireDate}')
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Mã đơn hàng:${data.orderId}',
                                style: GoogleFonts.spartan(
                                  textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Khách hàng: ${data.username}",
                                style: GoogleFonts.spartan(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    letterSpacing: -1,
                                  ),
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  text: "Tổng tiền:",
                                  style: GoogleFonts.spartan(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -1,
                                    ),
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          "  ${data.totalPrice.toVND(unit: 'VNĐ')}",
                                      style: GoogleFonts.spartan(
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.redAccent,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  text: "SĐT khách hàng:",
                                  style: GoogleFonts.spartan(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -1,
                                    ),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "  ${data.phone}",
                                      style: GoogleFonts.spartan(
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.redAccent,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "Địa chỉ giao hàng: ${data.address}",
                                style: GoogleFonts.spartan(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                    letterSpacing: -1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          enabled: true,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Center();
                    }),
              );
          }),
        ),
      ),
    );
  }
}
