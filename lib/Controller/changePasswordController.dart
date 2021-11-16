import 'package:appshop1/Api/api_service.dart';
import 'package:appshop1/Controller/LoginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangPasswordController extends GetxController {
  LoginController loginController = Get.put(LoginController());
  GlobalKey<FormState> pasFormKey = GlobalKey<FormState>();
  var oldController, newController, confirmController;
  var oldPassword = ''.obs;
  var password = ''.obs;
  var confirm = ''.obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    oldController = new TextEditingController();
    newController = new TextEditingController();
    confirmController = new TextEditingController();
  }

  Future<void> changePassword() async {
    if (checkChange() == true) {
      try {
        isLoading(true);
        final response = await APIService.change(
            loginController.box.read('userId'),
            oldPassword.value,
            password.value,
            loginController.box.read('token'));
        if (response.success == 1) {
          oldController.clear();
          newController.clear();
          confirmController.clear();
          return Get.snackbar(
            "THÔNG BÁO",
            "Thay đổi mật khẩu thành công",
            colorText: Colors.black,
            backgroundColor: Colors.white,
          );
        } else {
          return Get.snackbar(
            "THÔNG BÁO",
            "${response.data}",
            colorText: Colors.black,
            backgroundColor: Colors.white,
          );
        }
      } finally {
        isLoading(false);
      }
    }
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Mật khẩu phải có 6 kí tự trở lên";
    }
    return null;
  }

  String? validateConfirm(String value, String old) {
    if (value.length < 6) {
      return "Mật khẩu phải có 6 kí tự trở lên";
    } else {
      if (value != old) {
        return "Xác nhận mật khẩu sai";
      }
    }
    return null;
  }

  bool checkChange() {
    final form = pasFormKey.currentState;
    if (form!.validate() == true) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
