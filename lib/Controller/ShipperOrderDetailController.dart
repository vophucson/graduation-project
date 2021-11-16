import 'package:appshop1/Api/api_service.dart';
import 'package:appshop1/Controller/LoginController.dart';
import 'package:appshop1/Controller/shipperOrderController.dart';
import 'package:appshop1/Model/shipperOrderDetail_Model.dart';
import 'package:appshop1/Page/shipperOderPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShipperOrderDetailController extends GetxController {
  LoginController loginController = Get.put(LoginController());
  var orderDetail = <Data>[];
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchDetail(String orderId) async {
    try {
      isLoading(true);
      final response = await APIService.getShipperOrderDetail(
          orderId, loginController.box.read('token'));
      if (response.success == 1) {
        orderDetail.clear();
        orderDetail.addAll(response.data!);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> pickUpOrder(String orderId) async {
    final response =
        await APIService.pickUpOrder(orderId, loginController.box.read('token'));
    if (response.success == 1) {
      return Get.snackbar(
        'THÔNG BÁO',
        '${response.data}',
        colorText: Colors.black,
        backgroundColor: Colors.white,
      );
    }
  }
  Future<void> finishOrder(String orderId) async {
    final response =
    await APIService.finishOrder(orderId, loginController.box.read('token'));
    if (response.success == 1) {
      Get.back();
      return Get.snackbar(
        'THÔNG BÁO',
        '${response.data}',
        colorText: Colors.black,
        backgroundColor: Colors.white,
      );
    }
  }
  Future<void> cancelOrder(String orderId) async {
    final response =
    await APIService.cancelOrder(orderId, loginController.box.read('token'));
    if (response.success == 1) {
      Get.back();
      return Get.snackbar(
        'THÔNG BÁO',
        '${response.data}',
        colorText: Colors.black,
        backgroundColor: Colors.white,
      );
    }
  }
}
