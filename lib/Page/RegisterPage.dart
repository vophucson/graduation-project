import 'package:appshop1/Controller/RegisterController.dart';
import 'package:appshop1/Widget/fade_in_animation.dart';
import 'package:appshop1/Widget/side_in_animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterPages();
  }
}

class RegisterPages extends State<RegisterPage> {
  final RegisterController registerController = Get.put(RegisterController());
  bool hidePassword = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[200],
      body: _uiSetup(context),
    ));
  }

  @override
  Widget _uiSetup(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent,
        body: SideInAnimation(
          delay: 2,
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).hintColor.withOpacity(0.2),
                            offset: Offset(0, 10),
                            blurRadius: 20)
                      ],
                    ),
                    child: Obx(() {
                      if (registerController.isLoading.value)
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.redAccent),
                          ),
                        );
                      else
                        return Form(
                            key: registerController.registerKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(children: <Widget>[
                              SizedBox(height: 25),
                              Text(
                                "CHÀO MỪNG",
                                style: GoogleFonts.spartan(
                                  textStyle: TextStyle(
                                    fontSize: 30,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -1,
                                  ),
                                ),
                              ),
                              Text(
                                'Vui long điền một số thông tin',
                                style: GoogleFonts.spartan(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                    letterSpacing: -1,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              new TextFormField(
                                controller: registerController.emailController,
                                style: GoogleFonts.spartan(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.redAccent,
                                    letterSpacing: -1,
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                onSaved: (value) {
                                  registerController.email = value!;
                                },
                                validator: (value) {
                                  return registerController
                                      .validateEmail(value!);
                                },
                                decoration: new InputDecoration(
                                  hintText: "Địa chỉ Email",
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.redAccent
                                              .withOpacity(0.2))),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  prefixIcon: Icon(
                                    Icons.attach_email_rounded,
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              new TextFormField(
                                controller:
                                    registerController.passwordController,
                                style: GoogleFonts.spartan(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.redAccent,
                                    letterSpacing: -1,
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                onSaved: (value) {
                                  registerController.password = value!;
                                },
                                validator: (value) {
                                  return registerController
                                      .validatePassword(value!);
                                },
                                obscureText: hidePassword,
                                decoration: new InputDecoration(
                                  hintText: "Mât Khẩu",
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.redAccent
                                              .withOpacity(0.2))),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.redAccent,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        hidePassword = !hidePassword;
                                      });
                                    },
                                    color: Colors.redAccent.withOpacity(0.4),
                                    icon: Icon(hidePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              new TextFormField(
                                controller:
                                    registerController.usernameController,
                                style: GoogleFonts.spartan(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.redAccent,
                                    letterSpacing: -1,
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                onSaved: (value) {
                                  registerController.username = value!;
                                },
                                validator: (value) {
                                  return registerController
                                      .validateuserName(value!);
                                },
                                decoration: new InputDecoration(
                                  hintText: "Họ và Tên",
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.redAccent
                                              .withOpacity(0.2))),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  prefixIcon: Icon(
                                    Icons.supervised_user_circle_rounded,
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              new TextFormField(
                                controller: registerController.phoneController,
                                style: GoogleFonts.spartan(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.redAccent,
                                    letterSpacing: -1,
                                  ),
                                ),
                                keyboardType: TextInputType.phone,
                                onSaved: (value) {
                                  registerController.phone = value!;
                                },
                                validator: (value) {
                                  return registerController
                                      .validatePhone(value!);
                                },
                                decoration: new InputDecoration(
                                  hintText: "Số điện thoại",
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.redAccent
                                              .withOpacity(0.2))),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  prefixIcon: Icon(
                                    Icons.perm_phone_msg_rounded,
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              new TextFormField(
                                controller:
                                    registerController.addressController,
                                style: GoogleFonts.spartan(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.redAccent,
                                    letterSpacing: -1,
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                onSaved: (value) {
                                  registerController.address = value!;
                                },
                                validator: (value) {
                                  return registerController
                                      .validateAddress(value!);
                                },
                                decoration: new InputDecoration(
                                  hintText: "Địa chỉ",
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.redAccent
                                              .withOpacity(0.2))),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  prefixIcon: Icon(
                                    Icons.home,
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              FlatButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 80),
                                onPressed: () {
                                  registerController.Register();
                                },
                                child: Text(
                                  "Đăng Ký",
                                  style: GoogleFonts.spartan(
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -1,
                                    ),
                                  ),
                                ),
                                color: Colors.redAccent,
                                shape: StadiumBorder(),
                              ),
                              SizedBox(height: 20),
                            ]));
                    })),
              ],
            )
          ])),
        ));
  }
}
