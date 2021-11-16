import 'package:appshop1/Controller/changePasswordController.dart';
import 'package:appshop1/Widget/fade_in_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePassword extends StatelessWidget {
 final bool hidePassword = true;
 final ChangPasswordController changPasswordController = Get.put(ChangPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          brightness: Brightness.dark,
          elevation: 5,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text(
            'Thay đổi mật khẩu',
            style: GoogleFonts.spartan(
              textStyle: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.w700,
                letterSpacing: -1,
              ),
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black87,
            ),
            onPressed: () => Get.back(),
          ),
          actions: [],
        ),
        body: FadeInAnimation(
          delay: 3,
          child: SingleChildScrollView(
            child: Center(
              child: Obx(() {
                if (changPasswordController.isLoading.value)
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(100, 400, 100, 100),
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
                      ),
                    ),
                  );
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Form(
                    key: changPasswordController.pasFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TitleWidget(
                            icon: Icons.change_circle_outlined,
                            text: 'Thay đổi mật khẩu'),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 40),
                          child: new TextFormField(
                            controller: changPasswordController.oldController,
                            style: GoogleFonts.spartan(
                              textStyle: TextStyle(
                                fontSize: 13,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -1,
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            onSaved: (value) {
                              changPasswordController.oldPassword(value);
                            },
                            validator: (value) {
                              return changPasswordController.validatePassword(
                                  value!);
                            },
                            obscureText: true,
                            decoration: new InputDecoration(
                              hintText: "Nhập mật khẩu cũ",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.redAccent.withOpacity(
                                          0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 40),
                          child: new TextFormField(
                            controller: changPasswordController.newController,
                            style: GoogleFonts.spartan(
                              textStyle: TextStyle(
                                fontSize: 13,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -1,
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              changPasswordController.password(value);
                            },
                            onSaved: (value) {
                              changPasswordController.password(value);
                            },
                            validator: (value) {
                              return changPasswordController.validatePassword(
                                  value!);
                            },
                            obscureText: true,
                            decoration: new InputDecoration(
                              hintText: "Nhập mật khẩu mới",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.redAccent.withOpacity(
                                          0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              prefixIcon: Icon(
                                Icons.change_circle_rounded,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 40),
                          child: new TextFormField(
                            controller: changPasswordController
                                .confirmController,
                            style: GoogleFonts.spartan(
                              textStyle: TextStyle(
                                fontSize: 13,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -1,
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            onSaved: (value) {
                              changPasswordController.confirm(value);
                            },
                            validator: (value) {
                              return changPasswordController.validateConfirm(
                                  value!,
                                  changPasswordController.password.value);
                            },
                            obscureText: true,
                            decoration: new InputDecoration(
                              hintText: "Nhập lại mật khẩu mới",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.redAccent.withOpacity(
                                          0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              prefixIcon: Icon(
                                Icons.assignment_turned_in,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 50,
                          width: 190,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.redAccent,
                            onPressed: () {
                              changPasswordController.changePassword();
                              print(changPasswordController.password.value);
                            },
                            child: Text(
                              "Xác nhận",
                              style: GoogleFonts.spartan(
                                textStyle: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              ),
            ),
          ),
        ));
  }

}

class TitleWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const TitleWidget({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Icon(
            icon,
            size: 180,
            color: Colors.redAccent,
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: GoogleFonts.spartan(
              textStyle: TextStyle(
                fontSize: 30,
                color: Colors.black87,
                fontWeight: FontWeight.w700,
                letterSpacing: -1,
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      );
}
