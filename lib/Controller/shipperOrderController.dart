import 'package:appshop1/Api/api_service.dart';
import 'package:appshop1/Controller/LoginController.dart';
import 'package:appshop1/Model/shipperOrderModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShipperOrderController extends GetxController {
  LoginController loginController = Get.put(LoginController());
  var orderList = <Data>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getShipperOrder() async {
    try {
      isLoading(true);
      final response = await APIService.getShipperOrder(
          loginController.box.read('userId'), loginController.box.read('token'));
      print(response.success);
      if (response.success == 1) {
        orderList.clear();
        orderList.addAll(response.data!);
      } else {
        if (response.success == 2) {
          Get.back();
          return Get.snackbar(
            'THÔNG BÁO',
            'Bạn không có quyền sử dụng chức năng này',
            colorText: Colors.black,
            backgroundColor: Colors.white,
          );
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
