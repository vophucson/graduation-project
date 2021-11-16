import 'package:appshop1/BouncyPageRoute.dart';
import 'package:appshop1/Controller/OrderHistoryController.dart';
import 'package:appshop1/Page/OrderHistoryDetail.dart';
import 'package:appshop1/Widget/side_in_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';

class OrderHistoryPage extends StatelessWidget {
  final OrderHistoryController orderHistoryController =
      Get.put(OrderHistoryController());

  @override
  Widget build(BuildContext context) {
    orderHistoryController.fetchHistory();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Lịch sử đơn hàng',
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
      body: SideInAnimation(
        delay: 2,
        child: Container(
          child: Obx(() {
            if (orderHistoryController.isLoading.value)
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
                    itemCount: orderHistoryController.historyList.length,
                    itemBuilder: (context, index) {
                      var data = orderHistoryController.historyList[index];
                      return Card(
                        elevation: 4,
                        shadowColor: Colors.black87,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                BouncyPageRoute(
                                    widget: OrderHistoryDetail(
                                  orderId: data.orderId!,
                                )));
                          },
                          leading: Container(
                              height: 200,
                              width: 70,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(data.imageUrl!),
                                      fit: BoxFit.scaleDown))),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('Ngày đặt hàng: ${data.orderDate}')
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
                                "Sản phẩm: ${data.productName}",
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
                              Text(
                                "Tình trạng đơn hàng: ${data.status}",
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
