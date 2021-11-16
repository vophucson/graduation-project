import 'package:appshop1/Api/api_service.dart';
import 'package:appshop1/Controller/AddtocartController.dart';
import 'package:appshop1/Model/Cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'LoginController.dart';

class CartController extends GetxController {
  var cartList = <Data>[].obs;
  var isLoading = true.obs;
  var success = 0.obs;
  var totalX = 0.obs;
  var total = 0;
  LoginController loginController = Get.put(LoginController());
  @override
  void onInit() {
    super.onInit();
  }

  void fetchAllCart() async {
    print(loginController.box.read('token'));
    try {
      isLoading(true);
      var response = await APIService.getOrderdetail(
          loginController.box.read('token'), loginController.box.read('userId'));
      success(response.success);
      if (response.data != null) {
        cartList.clear();
        cartList.addAll(response.data!);
        total = 0;
        for(int i =0; i<response.data!.length; i++)
          {
            total = total + response.data![i].totalPrice!;
          }
        totalX(total);
      } else {
        cartList.clear();
      }
    } finally {
      isLoading(false);
    }
  }

  void deleteOrder(String orderId) async {
    var response =
        await APIService.deleteOrder(orderId, loginController.box.read('token'));
    if (response.success == 1) {
      fetchAllCart();
    } else {
      Get.snackbar(
        "Lỗi",
        "${response.message}",
        colorText: Colors.black,
        backgroundColor: Colors.white,
      );
    }
  }

}
