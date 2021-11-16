import 'package:appshop1/BouncyPageRoute.dart';
import 'package:appshop1/Widget/fade_in_animation.dart';
import 'package:appshop1/Widget/side_in_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'RegisterPage.dart';
import 'package:get/get.dart';
import 'package:appshop1/Controller/LoginController.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final LoginController loginController = Get.put(LoginController());
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
    return new SingleChildScrollView(
      child: new Container(
        child: Obx(() {
          if (loginController.isLoading.value)
            return Padding(
              padding: const EdgeInsets.fromLTRB(100, 400, 100, 100),
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
                ),
              ),
            );
          else
            return new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SideInAnimation(
                  delay: 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3.2,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.redAccent, Colors.redAccent]),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(150))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Align(
                          alignment: Alignment.center,
                          child: Image.network(
                            'https://i.pinimg.com/originals/1e/8a/ff/1e8aff78f02fcb887ebca580ad940c57.png',
                            fit: BoxFit.fitHeight,
                            width: 240,
                            color: Colors.white,
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 20, top: 20),
                      child: FadeInAnimation(
                        delay: 3,
                        child: Form(
                            key: loginFormKey,
                            child: Column(children: <Widget>[
                              SizedBox(height: 25),
                              Text(
                                "ĐĂNG NHẬP",
                                style: GoogleFonts.spartan(
                                  textStyle: TextStyle(
                                    fontSize: 28,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -1,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                child: new TextFormField(
                                  controller: loginController.emailcontroller,
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
                                    loginController.email = value!;
                                  },
                                  validator: (value) {
                                    return loginController.validateEmail(value!);
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
                              ),
                              // SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                child: new TextFormField(
                                  controller:
                                      loginController.passwordcontroller,
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
                                    loginController.password = value!;
                                  },
                                  validator: (value) {
                                    return loginController
                                        .validatePassword(value!);
                                  },
                                  obscureText: hidePassword,
                                  decoration: new InputDecoration(
                                    hintText: "Mật khẩu",
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
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.4),
                                      icon: Icon(
                                        hidePassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              FlatButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 45),
                                onPressed: () {
                                  if (Checklogin() == true) {
                                    loginController.Loginpage();
                                  }
                                },
                                child: Text(
                                  "Đăng nhập",
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
                              SizedBox(height: 15),
                              RichText(
                                  text: TextSpan(
                                      text: 'Người mới?',
                                      style: GoogleFonts.spartan(
                                        textStyle: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -1,
                                        ),
                                      ),
                                      children: <TextSpan>[
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              BouncyPageRoute(
                                                  widget: RegisterPage()));
                                        },
                                      text: 'Bấm vào đây để đăng ký',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          decoration: TextDecoration.underline,
                                          fontSize: 15,
                                          color: Colors.redAccent),
                                    )
                                  ])),
                            ])),
                      )),
                ),
              ],
            );
        }),
      ),
    );
  }

  bool Checklogin() {
    final form = loginFormKey.currentState;
    if (form!.validate() == true) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
