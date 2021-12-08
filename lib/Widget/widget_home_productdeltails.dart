import 'package:appshop1/Controller/AddtocartController.dart';
import 'package:appshop1/Controller/ProductdeltailsController.dart';
import 'package:appshop1/Controller/ReviewController.dart';
import 'package:appshop1/Page/HomePage.dart';
import 'package:appshop1/Page/ReviewPage.dart';
import 'package:appshop1/Widget/fade_in_animation.dart';
import 'package:appshop1/Widget/reviewUI.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appshop1/Widget/side_in_animation.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import '../BouncyPageRoute.dart';

class homeProductdeltails extends StatefulWidget {
  int data;
  bool isReload;
  homeProductdeltails({required this.data, required this.isReload});
  @override
  State<StatefulWidget> createState() {
    return _homeProductdeltails();
  }
}

class _homeProductdeltails extends State<homeProductdeltails> {
  final ProductdeltailsController productdeltailsController =
      Get.put(ProductdeltailsController());
  final Addtocart addtocart = Get.put(Addtocart());
  ReviewController reviewController = Get.put(ReviewController());
  bool isMore = false;
  double selectedIndex = 0;
  int numOfItems = 1;
  double _rating = 5.0;
  List<String> sizeList = [
    "36",
    "36.5",
    "37",
    "37.5",
    "38",
    "38.5",
    "39",
    "39.5",
    "40",
    "40.5",
    "41",
    "41.5",
    "42",
    "42.5",
    "43"
  ];
  @override
  void initState() {
    super.initState();
    if (this.widget.isReload) {
      Future.delayed(Duration.zero, () async {
        await productdeltailsController.fetchProductview(
            productId: this.widget.data);
      });
      Future.delayed(Duration.zero, () async {
        await reviewController.fetchAllreview(productId: this.widget.data);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildProductDetail(context),
    );
  }

  Widget _buildProductDetail(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Obx(() {
        if (productdeltailsController.isLoading.value ||
            reviewController.isLoading.value)
          return Center(
              child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent)));
        else {
          return Scaffold(
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width,
                      height: 250,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              width: size.width,
                              height: 250,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            height: 250,
                            top: 20,
                            left: 8.0,
                            right: 8.0,
                            child: SideInAnimation(
                              delay: 2,
                              child: Container(
                                width: 250,
                                height: 250,
                                margin: EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        productdeltailsController.imageUrl
                                            .toString()),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.0),
                    SideInAnimation(
                      delay: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "${productdeltailsController.productPricex.toVND(unit: 'VNĐ')}",
                                style: GoogleFonts.spartan(
                                  textStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -1,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  BoxIcon(icon: Icons.favorite_border),
                                  SizedBox(width: 12),
                                  BoxIcon(icon: Icons.share),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    SideInAnimation(
                      delay: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "${productdeltailsController.categoryName}",
                          style: GoogleFonts.spartan(
                            textStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SideInAnimation(
                      delay: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "${productdeltailsController.productName}",
                          style: GoogleFonts.spartan(
                            textStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    SideInAnimation(
                      delay: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "Chi tiết sản phẩm",
                          style: GoogleFonts.spartan(
                            textStyle: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SideInAnimation(
                      delay: 5,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 12.0),
                        child: Text(
                          "${productdeltailsController.description}",
                          style: GoogleFonts.spartan(
                            textStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                              letterSpacing: -1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SideInAnimation(
                      delay: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Chọn kích thước",
                          style: GoogleFonts.spartan(
                            textStyle: TextStyle(
                              fontSize: 17,
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SideInAnimation(
                      delay: 6,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          alignment: WrapAlignment.start,
                          runAlignment: WrapAlignment.start,
                          direction: Axis.horizontal,
                          children: sizeList
                              .map(
                                (e) => Container(
                                  width: 60,
                                  height: 60,
                                  padding: EdgeInsets.all(0),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedIndex = double.parse(e);
                                      });
                                      productdeltailsController
                                          .orderSize(double.parse(e));
                                    },
                                    minWidth: 50,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    color: selectedIndex == double.parse(e)
                                        ? Color(0xFFFFE6E6)
                                        : Colors.white,
                                    child: Center(
                                      child: Text(
                                        e,
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
                              )
                              .toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SideInAnimation(
                      delay: 7,
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 25, 0),
                          child: _quanityLabel()),
                    ),
                    SideInAnimation(
                      delay: 8,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Bình luận",
                              style: GoogleFonts.spartan(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -1,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    BouncyPageRoute(
                                        widget: ReviewPage(
                                      productId: productdeltailsController
                                          .productIdx.value,
                                      isReload: true,
                                    )));
                              },
                              child: Text(
                                "Xem tất cả",
                                style: GoogleFonts.spartan(
                                  textStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SideInAnimation(
                      delay: 8,
                      child: Obx(() {
                        if (reviewController.reviewList.length == 0)
                          return Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/comment.png'))),
                                ),
                                Text(
                                  'Chưa có bình luận',
                                  style: GoogleFonts.spartan(
                                    textStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -1,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          );
                        else
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
                              itemCount: reviewController.reviewList.length >= 3
                                  ? 3
                                  : reviewController.reviewList.length,
                              itemBuilder: (context, index) {
                                var data = reviewController.reviewList[index];
                                return ReviewUI(
                                  image: data.userimage == null
                                      ? ''
                                      : data.userimage,
                                  name: data.username,
                                  date: data.dayComment,
                                  comment: data.comment == ''
                                      ? 'Không bình luận'
                                      : data.comment,
                                  rating: data.star!.toDouble(),
                                  isLess: isMore,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                  thickness: 2.0,
                                  color: Color(0xFFF1F1F1),
                                );
                              },
                            ),
                          );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: FadeInAnimation(
              delay: 2,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 30,
                ),
                // height: 174,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -15),
                      blurRadius: 20,
                      color: Color(0xFFDADADA).withOpacity(0.15),
                    )
                  ],
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlatButton.icon(
                              onPressed: () {
                                Get.defaultDialog(
                                  title:
                                      "Đánh giá điểm số của sản phẩm theo ý kiến của bạn",
                                  content: Column(children: [
                                    Obx(
                                      () => GFRating(
                                        onChanged: (value) {
                                          reviewController.ratingValue(value);
                                        },
                                        size: 30.0,
                                        borderColor: Colors.amber,
                                        value:
                                            reviewController.ratingValue.value,
                                        color: Colors.amber,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: TextFormField(
                                        onChanged: (value) {
                                          reviewController.sendComment(value);
                                        },
                                        controller:
                                            reviewController.commentController,
                                        minLines: 2,
                                        maxLines: 5,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                            hintText: "Nhập bình luận của bạn",
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                                borderSide: BorderSide(
                                                    color: Colors.black87)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                                borderSide: BorderSide(
                                                    color: Colors.redAccent))),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: 150,
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        color: Colors.redAccent,
                                        onPressed: () {
                                          print(reviewController
                                              .sendComment.value);
                                          print(reviewController
                                              .ratingValue.value);
                                       //   reviewController.ratingValue(5.0);
                                          Get.back();
                                          reviewController.sendReview(
                                              productdeltailsController
                                                  .productIdx.value,
                                              reviewController.ratingValue.value
                                                  .toInt(),
                                              reviewController
                                                  .sendComment.value);
                                        //  Get.back();
                                        },
                                        child: Text(
                                          "Gủi bình luận",
                                          style: GoogleFonts.spartan(
                                            textStyle: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: -1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ]),
                                );
                              },
                              icon: Icon(
                                Icons.chat,
                                color: Colors.redAccent,
                              ),
                              label: Text(
                                "Bình luận",
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
                            FlatButton.icon(
                              onPressed: () {
                                addtocart.add(
                                    productdeltailsController.productIdx.value,
                                    numOfItems,
                                    productdeltailsController.orderSize.value
                                        .toDouble());
                                productdeltailsController.orderSize(0.0);
                              },
                              icon: Icon(
                                Icons.add_shopping_cart,
                                color: Colors.redAccent,
                              ),
                              label: Text(
                                "Thêm",
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
                            SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width / 3,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                color: Colors.redAccent,
                                onPressed: () {
                                  Get.offAll(() => HomePage());
                                },
                                child: Text(
                                  "Mua ngay",
                                  style: GoogleFonts.spartan(
                                    textStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -1,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      }),
    );
  }

  Widget _quanityLabel() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Số lượng",
            style: GoogleFonts.spartan(
              textStyle: TextStyle(
                fontSize: 17,
                color: Colors.black87,
                fontWeight: FontWeight.w700,
                letterSpacing: -1,
              ),
            ),
          ),
          buildquantity(context)
        ],
      ),
    );
  }

  Widget buildquantity(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            numOfItems.toString().padLeft(2, "0"),
            style: GoogleFonts.spartan(
              textStyle: TextStyle(
                fontSize: 17,
                color: Colors.redAccent,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }

  SizedBox buildOutlineButton({
    required IconData icon,
  }) {
    return SizedBox(
      width: 30,
      height: 30,
      child: OutlineButton(
        color: Colors.redAccent,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(icon),
        onPressed: () {},
      ),
    );
  }
}

class BoxIcon extends StatelessWidget {
  final IconData icon;
  BoxIcon({required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Icon(icon),
    );
  }
}
