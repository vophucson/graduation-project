import 'package:appshop1/Controller/ShipperOrderDetailController.dart';
import 'package:appshop1/Controller/shipperOrderController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';

class ShipperOrderDetail extends StatelessWidget {
  String orderId;
  ShipperOrderDetail({required this.orderId});
  ShipperOrderDetailController shipperOrderDetailController =
      Get.put(ShipperOrderDetailController());
  ShipperOrderController shipperOrderController =
      Get.put(ShipperOrderController());
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      await shipperOrderDetailController.fetchDetail(orderId);
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.dark,
        elevation: 5,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Chi tiết đơn hàng',
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
      body: Obx(() {
        if (shipperOrderDetailController.isLoading.value)
          return Center(
              child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor:
                  AlwaysStoppedAnimation<Color>(Colors.redAccent)));
        else
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Ngày đặt hàng: ${shipperOrderDetailController
                        .orderDetail[0].orderDate}",
                    style: GoogleFonts.spartan(
                      textStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Ngày giao hàng: ${shipperOrderDetailController
                        .orderDetail[0].expireDate}",
                    style: GoogleFonts.spartan(
                      textStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Mã đơn hàng : ${shipperOrderDetailController.orderDetail[0]
                    .orderId}",
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
            Row(
              children: [
                Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(shipperOrderDetailController
                                .orderDetail[0].imageUrl
                                .toString()),
                            fit: BoxFit.scaleDown))),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Sản phẩm: ${shipperOrderDetailController
                              .orderDetail[0].productName}",
                          style: GoogleFonts.spartan(
                            textStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              letterSpacing: -1,
                            ),
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Kích thước: ${shipperOrderDetailController
                            .orderDetail[0].productSize}",
                        style: GoogleFonts.spartan(
                          textStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            letterSpacing: -1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text.rich(
                TextSpan(
                  text: "Giá sản phẩm:",
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
                      "  ${shipperOrderDetailController.orderDetail[0]
                          .productPrice.toVND(unit: 'VNĐ')}",
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text.rich(
                TextSpan(
                  text: "Số lượng:",
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
                      "  ${shipperOrderDetailController.orderDetail[0]
                          .quantity}",
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text.rich(
                TextSpan(
                  text: "Dịch vụ giao hàng:",
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
                      "  ${shipperOrderDetailController.orderDetail[0]
                          .shipName}",
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text.rich(
                TextSpan(
                  text: "Phí giao hàng:",
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
                      "  ${shipperOrderDetailController.orderDetail[0].shipPrice
                          .toVND(unit: 'VND')}",
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text.rich(
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
                      "  ${shipperOrderDetailController.orderDetail[0]
                          .totalPrice.toVND(unit: 'VNĐ')}",
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Tên khách hàng: ${shipperOrderDetailController.orderDetail[0]
                    .username}",
                style: GoogleFonts.spartan(
                  textStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    // fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "SĐT khách hàng: ${shipperOrderDetailController.orderDetail[0]
                    .phone}",
                style: GoogleFonts.spartan(
                  textStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    // fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Địa chỉ giao hàng : ${shipperOrderDetailController
                    .orderDetail[0].address}",
                style: GoogleFonts.spartan(
                  textStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 3.5,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Colors.amberAccent,
                      onPressed: () {
                        shipperOrderDetailController.pickUpOrder(orderId);
                      },
                      child: Text(
                        "Lấy hàng",
                        style: GoogleFonts.spartan(
                          textStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 3.5,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Colors.green,
                      onPressed: () {
                        shipperOrderDetailController.finishOrder(orderId);
                        shipperOrderController.getShipperOrder();
                      },
                      child: Text(
                        "Xác nhận",
                        style: GoogleFonts.spartan(
                          textStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 3.5,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Colors.redAccent,
                      onPressed: () {
                        shipperOrderDetailController.cancelOrder(orderId);
                        shipperOrderController.getShipperOrder();
                      },
                      child: Text(
                        "Hủy bỏ",
                        style: GoogleFonts.spartan(
                          textStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      }
      )
    );
  }
}
