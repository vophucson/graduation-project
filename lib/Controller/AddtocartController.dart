import 'package:appshop1/Api/api_service.dart';
import 'package:appshop1/Controller/LoginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addtocart extends GetxController {
  LoginController loginController = Get.put(LoginController());
  @override
  void onInit() {
    super.onInit();
  }
  void add(int productId,int quantity,double productSize) async {
    if (productSize == 0.0) {
     return Get.snackbar(
        "THÔNG BÁO", "Bạn chưa chọn size", colorText: Colors.black,
        backgroundColor: Colors.white,);
    }
      try {
        var response = await APIService.Addtocart(
            productId, quantity, productSize, loginController.box.read('token'),
            loginController.box.read('userId'));
        print(response.success);
          if (response.success == 1) {
         return   Get.snackbar("THÔNG BÁO", "Thêm vào giỏi hàng thành công",
              colorText: Colors.black,
              backgroundColor: Colors.white,);
          }
          else {
         return   Get.snackbar(
              "Lỗi", "Không thể thêm vào giỏ hàng", colorText: Colors.black87,
              backgroundColor: Colors.white,);
          }
      } finally {}
    }
}