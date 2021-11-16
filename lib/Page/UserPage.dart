import 'package:appshop1/BouncyPageRoute.dart';
import 'package:appshop1/Controller/LoginController.dart';
import 'package:appshop1/Controller/ProfileController.dart';
import 'package:appshop1/Page/HomePage.dart';
import 'package:appshop1/Page/ChangePasswordPage.dart';
import 'package:appshop1/Page/orderHistoryPage.dart';
import 'package:appshop1/Widget/Widget_profileEdit.dart';
import 'package:appshop1/Widget/fade_in_animation.dart';
import 'package:appshop1/Widget/lock_screen.dart';
import 'package:appshop1/Widget/side_in_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'AboutPage.dart';

class UserPages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserPages();
  }
}

class _UserPages extends State<UserPages> {
  ProfileController profileController = Get.put(ProfileController());
  LoginController loginController = Get.put(LoginController());
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await profileController.fetchProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (profileController.isLoading.value)
          return Center(
              child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent)));
        else if (profileController.success.value == 1)
          return SideInAnimation(
            delay: 1,
            child: SafeArea(
                child: SingleChildScrollView(
              child:  Column(
                  children: [
                    //for circle avtar image
                    SizedBox(
                      height: 20,
                    ),
                    _heading("Xin chào: ${profileController.userName}"),
                    SizedBox(
                      height: 20,
                    ),
                     Obx(()
                       => Stack(
                        children: [
                          profileController.userImage.value == ''
                              ? CircleAvatar(
                            radius: 80,
                            backgroundImage: AssetImage('assets/no_avatar.jpg'),
                            backgroundColor: Colors.grey,
                          )
                              : CircleAvatar(
                            radius: 80,
                            backgroundImage:
                            NetworkImage(profileController.userImage.value),
                            backgroundColor: Colors.grey,
                          ),
                        ],
                    ),
                     ),
                    _detailsCard(),
                    _heading("Cài đặt"),
                    _settingsCard(),
                    //   Spacer(),
                    //     logoutButton()
                  ],
                ),
              ),
            ),
          );
        else
          return FadeInAnimation(delay: 2, child: LockScreen());
      }),
    );
  }


  Widget _heading(String heading) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90, //80% of width,
      child: Text(
        heading,
        style: GoogleFonts.spartan(
          textStyle: TextStyle(
            fontSize: 20,
            color: Colors.redAccent,
            fontWeight: FontWeight.w700,
            letterSpacing: -1,
          ),
        ),
      ),
    );
  }

  Widget _detailsCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        children: [
          Card(
            elevation: 5,
            shadowColor: Colors.black87,
            borderOnForeground: true,
            margin: EdgeInsets.zero,
            child: Container(
              height: 55,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context, BouncyPageRoute(widget: EditProfilePage()));
                },
                leading: Icon(
                  Icons.supervised_user_circle,
                  color: Colors.redAccent,
                ),
                title: Text(
                  "Xem và chỉnh sửa thông tin cá nhân",
                  style: GoogleFonts.spartan(
                    textStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Card(
            elevation: 5,
            shadowColor: Colors.black87,
            semanticContainer: true,
            borderOnForeground: true,
            margin: EdgeInsets.zero,
            child: Container(
              height: 55,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context, BouncyPageRoute(widget: OrderHistoryPage()));
                },
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.redAccent,
                ),
                title: Text(
                  "Xem lịch sử đơn hàng",
                  style: GoogleFonts.spartan(
                    textStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Card(
            elevation: 5,
            shadowColor: Colors.black87,
            semanticContainer: true,
            borderOnForeground: true,
            margin: EdgeInsets.zero,
            child: Container(
              height: 55,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context, BouncyPageRoute(widget: ChangePassword()));
                },
                leading: Icon(
                  Icons.security,
                  color: Colors.redAccent,
                ),
                title: Text(
                  "Thay đổi mật khẩu",
                  style: GoogleFonts.spartan(
                    textStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Card(
            elevation: 5,
            shadowColor: Colors.black87,
            semanticContainer: true,
            borderOnForeground: true,
            margin: EdgeInsets.zero,
            child: Container(
              height: 55,
              child: ListTile(
                onTap: () {
                  Navigator.pushReplacement(
                      context, BouncyPageRoute(widget: HomePage()));
                  loginController.box.write('token', 'Chua_co_tai_khoan_dang_nhap_vao_he_thong');
                  loginController.box.write('userId', 0);

                },
                leading: Icon(
                  Icons.logout,
                  color: Colors.redAccent,
                ),
                title: Text(
                  "Đăng xuất",
                  style: GoogleFonts.spartan(
                    textStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _settingsCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        children: [
          //row for each deatails
          Card(
            elevation: 5,
            shadowColor: Colors.black87,
            semanticContainer: true,
            borderOnForeground: true,
            margin: EdgeInsets.zero,
            child: Container(
              height: 55,
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.redAccent,
                ),
                title: Text(
                  "Cấu hình",
                  style: GoogleFonts.spartan(
                    textStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Card(
            elevation: 5,
            shadowColor: Colors.black87,
            semanticContainer: true,
            borderOnForeground: true,
            margin: EdgeInsets.zero,
            child: Container(
              height: 55,
              child: ListTile(
                onTap: () {
                  Navigator.push(context, BouncyPageRoute(widget: AboutPage()));
                },
                leading: Icon(
                  Icons.dashboard_customize,
                  color: Colors.redAccent,
                ),
                title: Text(
                  "Về chúng tôi",
                  style: GoogleFonts.spartan(
                    textStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
