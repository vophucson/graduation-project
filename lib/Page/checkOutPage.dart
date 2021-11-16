import 'package:appshop1/Controller/CheckOutController.dart';
import 'package:appshop1/Controller/LoginController.dart';
import 'package:appshop1/Controller/ProfileController.dart';
import 'package:appshop1/Widget/side_in_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appshop1/Controller/shipServiceController.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';

class CheckOutPage extends StatelessWidget {
  final int count, price;
  CheckOutPage({required this.count, required this.price});
  final ShipServiceController serviceController =
      Get.put(ShipServiceController());
  final CheckOutCOntroller checkOutCOntroller = Get.put(CheckOutCOntroller());
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      await serviceController.fetchShipService();
      await profileController.fetchProfile();
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.dark,
        elevation: 5,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Xác nhận đơn hàng',
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
      body: SideInAnimation(
        delay: 3,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/onBoard2.png'))),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Cảm ơn bạn đã mua hàng của chúng tôi",
                style: GoogleFonts.spartan(
                  textStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                  ),
                ),
              ),
              Text(
                "Bạn vui lòng chọn dịch vụ giao hàng và theo dõi đơn hàng sẽ được giao hàng trong tới gian tới",
                textAlign: TextAlign.center,
                style: GoogleFonts.spartan(
                  textStyle: TextStyle(
                    fontSize: 13,
                    color: Colors.black87,
                    letterSpacing: -1,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tổn số đơn hàng đã đặt",
                    style: GoogleFonts.spartan(
                      textStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                  Text(
                    "$count",
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
              divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Chọn dịch vụ giao hàng",
                    style: GoogleFonts.spartan(
                      textStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Obx(() => shipServiceList(context)),
              divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tổng tiền phải thành toán",
                    style: GoogleFonts.spartan(
                      textStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                  Obx(
                    () => Text(
                      "${serviceController.priceX == 0.obs ? price.toVND(unit: 'VNĐ') : serviceController.priceX.toVND(unit: 'VNĐ')} ",
                      style: GoogleFonts.spartan(
                        textStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hình thức thanh toán ",
                    style: GoogleFonts.spartan(
                      textStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                  Text(
                    "COD",
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
              divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Địa chỉ",
                    style: GoogleFonts.spartan(
                      textStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                  Obx(()
                    => Text(
                      " ${profileController.address}",
                      style: GoogleFonts.spartan(
                        textStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              divider(),
              Expanded(child: Container()),
              InkWell(
                hoverColor: Colors.black,
                onTap: () {
                  checkOutCOntroller.Checkout(
                      serviceController.selectIndex.value);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text(
                      "XÁC NHẬN",
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Container divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 1,
      color: Colors.grey,
    );
  }

  Widget shipServiceList(BuildContext context) {
    return  Container(
        height: 100,
        child: ListView.builder(
            //  shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: serviceController.serviceList.length,
            itemBuilder: (context, index) {
              var data = serviceController.serviceList[index];
              return Container(
                //    width: 150,
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey),
                ),
                child:  Obx(()
                  => FlatButton(
                      onPressed: () {
                        serviceController.selectIndex(data.id);
                        serviceController.priceX(price + (data.shipPrice! * count));
                      },
                      minWidth: 50,
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: serviceController.selectIndex.value == data.id
                          ? Colors.grey[200]
                          : Colors.white,
                      child: Column(
                        children: [
                          Text(
                            "Dịch vụ",
                            style: GoogleFonts.spartan(
                              textStyle: TextStyle(
                                fontSize: 13,
                                color: Colors.black87,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -1,
                              ),
                            ),
                          ),
                          Text(
                            "${data.shipName}",
                          ),
                          Text(
                            "Thời gian giao hàng:",
                          ),
                          Text(
                            " ${data.shipDay}" + " ngày tính từ thời điểm xác nhận",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Giá:" +
                                " ${data.shipPrice.toVND(unit: 'VNĐ')} /đơn hàng",
                            style: GoogleFonts.spartan(
                              textStyle: TextStyle(
                                fontSize: 13,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -1,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                ),
                );
            },
          ),
        );
  }
}
