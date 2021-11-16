import 'package:appshop1/Api/firebase_api.dart';
import 'package:appshop1/Controller/LoginController.dart';
import 'package:appshop1/Controller/ProfileController.dart';
import 'package:appshop1/Widget/fade_in_animation.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  UploadTask? task;
  ProfileController profileController = Get.put(ProfileController());
  File? imageFile;
  bool isLoad = false;
  Future getImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: source);
    File? cropped = await ImageCropper.cropImage(
        cropStyle: CropStyle.circle,
        sourcePath: image!.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxWidth: 600,
        maxHeight: 600,
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: AndroidUiSettings(
          toolbarColor: Colors.redAccent,
          toolbarTitle: "Chỉnh sử hình ảnh",
          statusBarColor: Colors.redAccent.shade700,
          backgroundColor: Colors.white,
        ));
    this.setState(() {
      imageFile = cropped!;
    });
  }

  Future uploadFile() async {
    try {
      setState(() {
        isLoad = true;
      });
      final fileName =
          "Avatar" + "${Get.find<LoginController>().box.read('userId')}" + ".jpg";
      final destination = 'file/$fileName';
      task = FirebaseApi.uploadFile(destination, imageFile!);
      // if(task ==null) return;
      final snapshot = await task!.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();
      print(urlDownload);
      profileController.userImageEdit(urlDownload);
      profileController.updateProfile();
      setState(() {
        imageFile = null;
      });
    } finally {
      setState(() {
        isLoad = false;
      });
    }
  }

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
        appBar: AppBar(
          centerTitle: true,
          brightness: Brightness.dark,
          elevation: 5,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text(
            'Chỉnh sử thông tin',
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
        body: Container(
          child: Form(
            key: profileController.profileFormKey,
            child: Obx(() {
              if (isLoad == true || profileController.isLoading.value == true)
                return Center(
                    child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.redAccent)));
              else {
                return FadeInAnimation(
                  delay: 3,
                  child: ListView(
                    children: [
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          CustomPaint(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 3,
                            ),
                            painter: HeaderCurvedContainer(),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 11,
                              ),
                              imageFile == null
                                  ? profileController.userImage.value == ''
                                      ? Container(
                                          padding: EdgeInsets.all(10.0),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.3,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 5),
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    'assets/no_avatar.jpg')),
                                          ),
                                        )
                                      : Container(
                                          padding: EdgeInsets.all(10.0),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.3,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 5),
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    profileController.userImage
                                                        .toString())),
                                          ),
                                        )
                                  : Container(
                                      padding: EdgeInsets.all(10.0),
                                      width: MediaQuery.of(context).size.width /
                                          2.3,
                                      height:
                                          MediaQuery.of(context).size.width /
                                              2.3,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 5),
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: FileImage(imageFile!)),
                                      ),
                                    )
                            ],
                          ),
                          Positioned(
                              bottom: 30,
                              right: 110,
                              child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                    color: Colors.redAccent,
                                  ),
                                  child: IconButton(
                                    padding: EdgeInsets.all(5.0),
                                    icon: Icon(Icons.edit),
                                    color: Colors.white,
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: ((builder) => bottomSheet()),
                                      );
                                    },
                                  ))),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        child: TextFormField(
                          style: GoogleFonts.spartan(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              letterSpacing: -1,
                            ),
                          ),
                          initialValue: "${profileController.userName}",
                          onSaved: (value) {
                            profileController.userNameEdit(value);
                            print(value);
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 3),
                            labelText: "Họ và tên",
                            labelStyle: GoogleFonts.spartan(
                              textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -1,
                              ),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black87.withOpacity(0.5))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.redAccent)),
                          ),
                          validator: (value) {
                            return profileController.validateName(value!);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        child: TextFormField(
                          initialValue: "${profileController.phone}",
                          style: GoogleFonts.spartan(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              letterSpacing: -1,
                            ),
                          ),
                          onSaved: (value) {
                            profileController.phoneEdit(value);
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 3),
                            labelText: "Sô điện thoại",
                            labelStyle: GoogleFonts.spartan(
                              textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -1,
                              ),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black87.withOpacity(0.5))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.redAccent)),
                          ),
                          validator: (value) {
                            return profileController.validatePhone(value!);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 0),
                        child: TextFormField(
                          initialValue: "${profileController.address.value}",
                          style: GoogleFonts.spartan(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              letterSpacing: -1,
                            ),
                          ),
                          onSaved: (value) {
                            profileController.addressEdit(value);
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 3),
                            labelText: "Địa chỉ ",
                            labelStyle: GoogleFonts.spartan(
                              textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -1,
                              ),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black87.withOpacity(0.5))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.redAccent)),
                          ),
                          validator: (value) {
                            return profileController.validateAddress(value!);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 70,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                        child: RaisedButton(
                          onPressed: () {
                            if (imageFile == null) {
                              profileController.userImageEdit(
                                  profileController.userImage.value);
                                profileController.updateProfile();
                            } else {
                              if (profileController.checkProfile() == false) {
                              } else {
                                uploadFile();
                              }
                            }
                          },
                          color: Colors.redAccent,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "Cập nhật",
                            style: GoogleFonts.spartan(
                              textStyle: TextStyle(
                                fontSize: 25,
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
                );
              }
            }),
          ),
        ));
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          Text(
            "Chọn hình ảnh đại diện",
            style: GoogleFonts.spartan(
              textStyle: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.w700,
                letterSpacing: -1,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(
                  Icons.camera_alt,
                  color: Colors.redAccent,
                ),
                onPressed: () {
                  getImage(ImageSource.camera);
                },
                label: Text(
                  "Camera",
                  style: GoogleFonts.spartan(
                    textStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ),
              FlatButton.icon(
                icon: Icon(
                  Icons.image,
                  color: Colors.redAccent,
                ),
                onPressed: () {
                  getImage(ImageSource.gallery);
                },
                label: Text(
                  "Gallery",
                  style: GoogleFonts.spartan(
                    textStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.redAccent;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
