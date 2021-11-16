
import 'package:appshop1/Api/api_service.dart';
import 'package:appshop1/Controller/LoginController.dart';
import 'package:appshop1/Model/Review_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController {
  var reviewList = <Data>[].obs;
  var isLoading = true.obs;
  var oneStart = 0.obs;
  var twoStart = 0.obs;
  var threeStart = 0.obs;
  var fourStart = 0.obs;
  var fiveStart = 0.obs;
  RxDouble rating = 5.0.obs;
  int sumStart = 0;
  var countView = 0.obs;
  late List<double> ratingList;
  LoginController loginController = Get.put(LoginController());
  var ratingValue = 5.0.obs;
  var commentController;
  var sendComment =''.obs;
  @override
  void onInit() {
    super.onInit();
    commentController = new TextEditingController();
  }

  Future<void> sendReview(
    int productId,
    int star,
    String comment,
  ) async {
    // isLoading(true);
      try {
        var response = await APIService.sendReview(productId, star, comment,
            loginController.box.read('userId'), loginController.box.read('token'));
        if (response.success == 1) {
          fetchAllreview(productId: productId);
          commentController.clear();
          ratingValue(5.0);
          return Get.snackbar(
            "THÔNG CÁO",
            "Cảm ơn sự chia sẻ của bạn",
            colorText: Colors.black,
            backgroundColor: Colors.white,
          );
        } else {
          return Get.snackbar(
            "LỖI",
            "Bạn không thể bình luận",
            colorText: Colors.black,
            backgroundColor: Colors.white,
          );
        }
      } finally {
        //   isLoading(false);
      }
  }

  void onClose() {
    super.onClose();
    sumStart = 0;
    oneStart(0);
    twoStart(0);
    threeStart(0);
    fourStart(0);
    fiveStart(0);
    rating(5);
    countView(0);
  }

  Future<void> fetchAllreview({required int productId}) async {
    sumStart = 0;
    oneStart(0);
    twoStart(0);
    threeStart(0);
    fourStart(0);
    fiveStart(0);
    countView(0);
    ratingList = [];
    try {
      isLoading(true);
      var response = await APIService.getReview(productId);
      if (response.success == 1) {
        reviewList.clear();
        reviewList.addAll(response.data!);
        var length = response.data!.length;
        for (int i = 0; i < response.data!.length; i++) {
          if (response.data![i].star == 5) {
            fiveStart.value++;
            sumStart += 5;
          }
          if (response.data![i].star == 4) {
            fourStart.value++;
            sumStart += 4;
          }
          if (response.data![i].star == 3) {
            threeStart.value++;
            sumStart += 3;
          }
          if (response.data![i].star == 2) {
            twoStart.value++;
            sumStart += 2;
          }
          if (response.data![i].star == 1) {
            oneStart.value++;
            sumStart += 1;
          }
          if (response.data![i].comment != "") {
            countView.value++;
          }
        }
        if (response.data!.length != 0) {
          rating(sumStart / response.data!.length);
        } else {
          rating(5);
        }
        if(response.data!.length > 0) {
          ratingList.add((oneStart.value / length).toDouble());
          ratingList.add((twoStart.value / length).toDouble());
          ratingList.add((threeStart.value / length).toDouble());
          ratingList.add((fourStart.value / length).toDouble());
          ratingList.add((fiveStart.value / length).toDouble());
        }
        else
          {
            ratingList = [0,0,0,0,1];
          }
      }
    } finally {
      isLoading(false);
    }
  }
}
