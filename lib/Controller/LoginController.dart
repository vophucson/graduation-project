import 'package:appshop1/Api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  var emailcontroller,passwordcontroller;
  var email = '';
  var password = '';
  var isLoading = false.obs;
  final box = GetStorage();
  @override
  void onInit() {
    super.onInit();
    emailcontroller = new TextEditingController();
    passwordcontroller = new TextEditingController();
  }
  Future<void> Loginpage() async {
      print(email);
      isLoading(true);
      try {
        var response = await APIService.login(email, password);
        if (response.success == 1) {
          emailcontroller.clear();
          passwordcontroller.clear();
          box.write('token', response.token);
          box.write('userId', response.idUser);
          Get.offAllNamed("/home");
        }
        else {
          Get.snackbar("Thông báo", response.data!, colorText: Colors.black,
            backgroundColor: Colors.white,);
        }
      } finally {
        isLoading(false);
      }

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }
  String? validateEmail (String value){
    if(!GetUtils.isEmail(value))
    {
      return "Địa chỉ email không hợp lệ";
    }
    return null;

  }
  String? validatePassword (String value){
    if(value.length < 6)
    {
      return "Mật khẩu phải có 6 kí tự trở lên";
    }
    return null;
  }



  }

