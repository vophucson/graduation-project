import 'package:appshop1/Api/api_service.dart';
import 'package:appshop1/Controller/LoginController.dart';
import 'package:appshop1/Model/orderHistoryDetail_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistoryDetailController extends GetxController {
  var isLoading = true.obs;
  LoginController loginController = Get.put(LoginController());
  var orderIdx = ''.obs;
  var productName = ''.obs;
  var productPrice = 0.obs;
  var orderDate = ''.obs;
  var expireDate = ''.obs;
  var quantity =0.obs;
  var totalPrice =0.obs;
  var status =''.obs;
  var productSize =0.0.obs;
  var shipName = ''.obs;
  var shipperName =''.obs;
  var phoneShipper = ''.obs;
  var shipPrice =0.obs;
  var shipAddress = ''.obs;
  var imageUrl = ''.obs;
  var trackOrderList =[];
  var check1 = true.obs;
  var check2 = true.obs;
  var check3 = true.obs;
  var check4 = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getHistoryDetail(String orderId) async {
    try {
      isLoading(true);
      trackOrderList =[];
      shipName('');
      expireDate('');
      shipPrice(0);
      var response = await APIService.getOrderHistoryDetail(
          orderId, loginController.box.read('token'));
      if (response.data !=null) {
        orderIdx(response.data![0].orderId);
        productName(response.data![0].productName);
        productPrice(response.data![0].productPrice);
        orderDate(response.data![0].orderDate);
        expireDate(response.data![0].expireDate);
        quantity(response.data![0].quantity);
        totalPrice(response.data![0].totalPrice);
        status(response.data![0].status);
        productSize(response.data![0].productSize.toDouble());
        shipName(response.data![0].shipNane);
        phoneShipper(response.data![0].phoneShipper);
        shipPrice(response.data![0].shipPrice);
        shipAddress(response.data![0].shipAddress);
        shipperName(response.data![0].shipperName);
        imageUrl(response.data![0].imageUrl);
      }
      if(response.data![0].status =='Chưa thanh toán')
        {
          check1(false);
          check2(false);
          check3(false);
          check4(0);
          trackOrderList = [
            TrackOrderModal(
              icon: Icons.assignment_turned_in,
              title: "Xác nhận đơn hàng",
              subtitle: "Chưa xác nhận\nVui lòng xác nhận đơn hàng",
            ),
            TrackOrderModal(
              icon: Icons.person,
              title: "Xử lý đơn hàng",
              subtitle: "Chưa xác nhận\nVui lòng xác nhận đơn hàng",
            ),
            TrackOrderModal(
              icon: Icons.run_circle,
              title: "Giao hàng",
              subtitle: "Chưa xác nhận\nVui lòng xác nhận đơn hàng",
            ),
            TrackOrderModal(
              icon: Icons.home_work_outlined,
              title: "Nhận hàng",
              subtitle: "Chưa xác nhận\nVui lòng xác nhận đơn hàng",
            ),
          ];
        }
      if (response.data![0].status =='Đang xử lý')
        {
          check1(true);
          check2(false);
          check3(false);
          check4(0);
          trackOrderList = [
            TrackOrderModal(
              icon: Icons.assignment_turned_in,
              title: "Xác nhận đơn hàng",
              subtitle: "Đơn hàng đã được tiếp nhận\nCảm ơn bạn đã mua hàng",
            ),
            TrackOrderModal(
              icon: Icons.person,
              title: "Xử lý đơn hàng",
              subtitle: "Đang trong quá trình xử lý",
            ),
            TrackOrderModal(
              icon: Icons.run_circle,
              title: "Giao hàng",
              subtitle: "Đang trong quá trình xử lý",
            ),
            TrackOrderModal(
              icon: Icons.home_work_outlined,
              title: "Nhận hàng",
              subtitle: "Đang trong quá trình xử lý",
            ),
          ];
        }
      if (response.data![0].status =='Đang giao hàng')
      {
        check1(true);
        check2(true);
        check3(false);
        check4(0);
        trackOrderList = [
          TrackOrderModal(
            icon: Icons.assignment_turned_in,
            title: "Xác nhận đơn hàng",
            subtitle: "Đơn hàng đã được tiếp nhận\nCảm ơn bạn đã mua hàng",
          ),
          TrackOrderModal(
            icon: Icons.person,
            title: "Xử lý đơn hàng",
            subtitle: "Đơn hàng đã được giao cho Shipper:${ shipperName.value}\nSố điện thoại:${phoneShipper.value}",
          ),
          TrackOrderModal(
            icon: Icons.run_circle,
            title: "Giao hàng",
            subtitle: "Đang trong quá trình xử lý",
          ),
          TrackOrderModal(
            icon: Icons.home_work_outlined,
            title: "Nhận hàng",
            subtitle: "Đang trong quá trình xử lý",
          ),
        ];
      }
      if (response.data![0].status =='Nhân viên đã lấy hàng và đang đi giao')
      {
        check1(true);
        check2(true);
        check3(true);
        check4(0);
        trackOrderList = [
          TrackOrderModal(
            icon: Icons.assignment_turned_in,
            title: "Xác nhận đơn hàng",
            subtitle: "Đơn hàng đã được tiếp nhận\nCảm ơn bạn đã mua hàng",
          ),
          TrackOrderModal(
            icon: Icons.person,
            title: "Xử lý đơn hàng",
            subtitle: "Đơn hàng đã được giao cho Shipper:${ shipperName.value}\nSố điện thoại:${phoneShipper.value}",
          ),
          TrackOrderModal(
            icon: Icons.run_circle,
            title: "Giao hàng",
            subtitle: "Shipper: ${shipperName.value} đã lấy hàng và đang đi giao.",
          ),
          TrackOrderModal(
            icon: Icons.home_work_outlined,
            title: "Nhận hàng",
            subtitle: "Đang trong quá trình xử lý",
          ),
        ];
      }
      if (response.data![0].status =='Đã nhận hàng')
      {
        check1(true);
        check2(true);
        check3(true);
        check4(1);
        trackOrderList = [
          TrackOrderModal(
            icon: Icons.assignment_turned_in,
            title: "Xác nhận đơn hàng",
            subtitle: "Đơn hàng đã được tiếp nhận\nCảm ơn bạn đã mua hàng",
          ),
          TrackOrderModal(
            icon: Icons.person,
            title: "Xử lý đơn hàng",
            subtitle: "Đơn hàng đã được giao cho Shipper:${ shipperName.value}\nSố điện thoại:${phoneShipper.value}",
          ),
          TrackOrderModal(
            icon: Icons.run_circle,
            title: "Giao hàng",
            subtitle: "Shipper: ${shipperName.value} đã lấy hàng và đang đi giao.",
          ),
          TrackOrderModal(
            icon: Icons.home_work_outlined,
            title: "Nhận hàng",
            subtitle: "Khách hàng nhận hàng thành công",
          ),
        ];
      }
      if (response.data![0].status =='Hủy đơn hàng')
      {
        check1(true);
        check2(true);
        check3(true);
        check4(2);
        trackOrderList = [
          TrackOrderModal(
            icon: Icons.assignment_turned_in,
            title: "Xác nhận đơn hàng",
            subtitle: "Đơn hàng đã được tiếp nhận\nCảm ơn bạn đã mua hàng",
          ),
          TrackOrderModal(
            icon: Icons.person,
            title: "Xử lý đơn hàng",
            subtitle: "Đơn hàng đã được giao cho Shipper:${ shipperName.value}\nSố điện thoại:${phoneShipper.value}",
          ),
          TrackOrderModal(
            icon: Icons.run_circle,
            title: "Giao hàng",
            subtitle: "Shipper: ${shipperName.value} đã lấy hàng và đang đi giao.",
          ),
          TrackOrderModal(
            icon: Icons.home_work_outlined,
            title: "Nhận hàng",
            subtitle: "Đơn hàng đã được hủy",
          ),
        ];
      }
    } finally {
      isLoading(false);
    }
  }
}
class TrackOrderModal {
  IconData? icon;
  String? title;
  String? subtitle;

  TrackOrderModal({this.icon, this.title, this.subtitle});
}

