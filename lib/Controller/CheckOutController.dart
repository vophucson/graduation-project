import 'package:appshop1/Api/api_service.dart';
import 'package:appshop1/Controller/CartController.dart';
import 'package:appshop1/Controller/LoginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutCOntroller extends GetxController {
  CartController cartController = Get.put(CartController());
  LoginController loginController = Get.put(LoginController());
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> Checkout(int shipId) async {
    if (shipId == 0) {
   return Get.snackbar(
        "THÔNG BÁO",
        "Bạn chưa chọn dịch vụ giao hàng",
        colorText: Colors.black,
        backgroundColor: Colors.white,
      );
    } else {
      for (int i = 0; i < cartController.cartList.length; i++) {
        var response = await APIService.Checkout(
            cartController.cartList[i].orderId.toString(),
            loginController.box.read('token'),
            shipId);
        if (response.success == 0) {
          return Get.snackbar(
            "Lỗi",
            "Đã có lỗi xảy ra",
            colorText: Colors.black,
            backgroundColor: Colors.white,
          );
        }
      }
      cartController.fetchAllCart();
      Get.back();
      Get.snackbar(
        "THÔNG BÁO",
        "Cảm ơn bạn đã mua hàng",
        colorText: Colors.black,
        backgroundColor: Colors.white,
      );
    }
  }
}
