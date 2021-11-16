import 'package:appshop1/Controller/LoginController.dart';
import 'package:appshop1/Page/HomePage.dart';
import 'package:appshop1/Page/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Widget _defaultHome = HomePage();

Future main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (loginController.box.read('token') == null) {
      loginController.box
          .write('token', 'chua_co_tai_Khoan_nao_dang_nhap_vao_he_Thong');
    }
    if (loginController.box.read('userId') == null) {
      loginController.box.write('userId', 0);
    }
    return GetMaterialApp(
      title: 'Shoes Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.redAccent,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan[600])),
      home: _defaultHome,
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new HomePage(),
        '/login': (BuildContext context) => new LoginPage(),
      },
    );
  }
}
