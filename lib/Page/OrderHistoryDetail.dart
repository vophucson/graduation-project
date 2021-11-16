import 'package:appshop1/Controller/OrderHistoryDetailController.dart';
import 'package:appshop1/Controller/ProfileController.dart';
import 'package:appshop1/Widget/side_in_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';

class OrderHistoryDetail extends StatelessWidget {
 final String orderId;
  OrderHistoryDetail({required this.orderId});
 final OrderHistoryDetailController _orderHistoryDetailController =
      Get.put(OrderHistoryDetailController());

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      await _orderHistoryDetailController.getHistoryDetail(orderId);
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Chi tiết đơn hàng',
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
      body: Obx(() {
        if (_orderHistoryDetailController.isLoading.value)
          return Center(
              child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent)));
        else
          return SideInAnimation(
            delay: 3,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Ngày đặt hàng: ${_orderHistoryDetailController.orderDate}",
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
                          "Ngày giao hàng: ${_orderHistoryDetailController.expireDate.value == '' ? ' Chưa xác định' : _orderHistoryDetailController.expireDate}",
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
                      "Mã đơn hàng : ${_orderHistoryDetailController.orderIdx}",
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
                                  image: NetworkImage(
                                      _orderHistoryDetailController.imageUrl
                                          .toString()),
                                  fit: BoxFit.scaleDown))),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width:  MediaQuery.of(context).size.width/2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                "Sản phẩm: ${_orderHistoryDetailController.productName}",
                                style: GoogleFonts.spartan(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    letterSpacing: -1,
                                  ),
                                ),
                                overflow: TextOverflow.clip,
                                maxLines: 2,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              "Kích thước: ${_orderHistoryDetailController.productSize}",
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
                                "  ${_orderHistoryDetailController.productPrice.toVND(unit: 'VNĐ')}",
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
                            text: "  ${_orderHistoryDetailController.quantity}",
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
                                "  ${_orderHistoryDetailController.shipName == ''.obs ? 'Chưa chọn' : _orderHistoryDetailController.shipName}",
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
                                "  ${_orderHistoryDetailController.shipPrice.toVND(unit: 'VND')}",
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
                                "  ${_orderHistoryDetailController.totalPrice.toVND(unit: 'VNĐ')}",
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
                      "Tình trạng đơn hàng : ${_orderHistoryDetailController.status}",
                      style: GoogleFonts.spartan(
                        textStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          //    fontWeight: FontWeight.w700,
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Địa chỉ giao hàng : ${_orderHistoryDetailController.shipAddress}",
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
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 16.0,
                    ),
                    child: Text(
                      "Lịch sử",
                      style: GoogleFonts.spartan(
                        textStyle: TextStyle(
                          fontSize: 20,
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
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width / 6,
                        child: IconStepper(
                          direction: Axis.vertical,
                          enableNextPreviousButtons: false,
                          enableStepTapping: false,
                          stepColor: Colors.redAccent,
                          activeStepColor: Colors.redAccent,
                          activeStepBorderColor: Color(0xFFFFFFFF),
                          activeStepBorderWidth: 0.0,
                          activeStepBorderPadding: 0.0,
                          lineColor: Colors.redAccent,
                          lineLength: 70.0,
                          lineDotRadius: 2.0,
                          stepRadius: 16.0,
                          icons: [
                            _orderHistoryDetailController.check1.value == false
                                ? Icon(Icons.radio_button_checked,
                                    color: Colors.redAccent)
                                : Icon(Icons.check, color: Color(0xFFFFFFFF)),
                            _orderHistoryDetailController.check2.value == false
                                ? Icon(Icons.radio_button_checked,
                                    color: Colors.redAccent)
                                : Icon(Icons.check, color: Color(0xFFFFFFFF)),
                            _orderHistoryDetailController.check3.value == false
                                ? Icon(Icons.radio_button_checked,
                                    color: Colors.redAccent)
                                : Icon(Icons.check, color: Color(0xFFFFFFFF)),
                            _orderHistoryDetailController.check4.value == 0
                                ? Icon(Icons.radio_button_checked,
                                    color: Colors.redAccent)
                                : _orderHistoryDetailController.check4.value ==
                                        1
                                    ? Icon(Icons.check,
                                        color: Color(0xFFFFFFFF))
                                    : Icon(Icons.clear,
                                        color: Color(0xFFFFFFFF)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: _orderHistoryDetailController
                              .trackOrderList.length,
                          itemBuilder: (context, index) {
                            var data = _orderHistoryDetailController
                                .trackOrderList[index];
                            return Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  child: ListTile(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 13.0),
                                    leading: Icon(
                                      data.icon,
                                      size: 48.0,
                                      color: Color(0xFFFF8084),
                                    ),
                                    title: Text(
                                      data.title,
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                    subtitle: Text(
                                      data.subtitle,
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
      }),
    );
  }
}

class TrackOrderModal {
  IconData? icon;
  String? title;
  String? subtitle;

  TrackOrderModal({this.icon, this.title, this.subtitle});
}
