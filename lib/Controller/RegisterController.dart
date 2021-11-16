import 'package:appshop1/Api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RegisterController extends GetxController {
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  var emailController,passwordController,usernameController,phoneController,addressController;
  var email='';
  var password = '';
  var username = '';
  var phone = '';
  var address = '';
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    emailController = new TextEditingController();
    passwordController = new TextEditingController();
    usernameController = new TextEditingController();
    phoneController = new TextEditingController();
    addressController = new TextEditingController();
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    addressController.dispose();
  }
  Future<void> Register() async {
    if(checkRegister()==true) {
      isLoading(true);
      try {
        var response = await APIService.register(
            email, password, username, phone, address);
        if (response.success == 1) {
          Get.back();
          emailController.clear();
          passwordController.clear();
          usernameController.clear();
          phoneController.clear();
          addressController.clear();
          Get.snackbar("THÔNG BÁO", "${response.data}", colorText: Colors.black,
            backgroundColor: Colors.white,);
        }
        else {
          Get.snackbar("THÔNG BÁO", "${response.data}", colorText: Colors.black,
            backgroundColor: Colors.white,);
        }
      } finally {
        isLoading(false);
      }
    }
  }
  String? validateEmail (String value){
    if(!GetUtils.isEmail(value))
    {
      return "Địa chỉ Email không hợp lệ";
    }
    return null;

  }
  String? validatePassword (String value){
    if(value.length < 6)
    {
      return "Mật khẩu phải từ 6 ký tự trở lên";
    }
    return null;
  }
  String? validateuserName (String value) {
    if(value.length ==0)
      {
        return "Họ và tên không được để trống";
      }
    return null;
  }
  String? validatePhone (String value){
    if(!value.isPhoneNumber)
      {
        return "Số điện thoại không hợp lệ";
      }
    return null;
  }
  String? validateAddress (String value){
    if(value.length==0)
      {
        return "Địa chỉ không được để trống";
      }
    return null;
  }
  bool checkRegister(){
    final form = registerKey.currentState;
    if(form!.validate() ==true) {
      form.save();
      return true;
    }
    else
    {
      return false;
    }
  }
}