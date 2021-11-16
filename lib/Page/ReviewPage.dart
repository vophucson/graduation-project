import 'package:appshop1/Controller/AddtocartController.dart';
import 'package:appshop1/Controller/ReviewController.dart';
import 'package:appshop1/Page/HomePage.dart';
import 'package:appshop1/Widget/Widget_profileEdit.dart';
import 'package:appshop1/Widget/fade_in_animation.dart';
import 'package:appshop1/Widget/reviewUI.dart';
import 'package:appshop1/Widget/side_in_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ReviewPage extends StatefulWidget {
  final int productId;
 final bool isReload;
  ReviewPage({required this.productId, required this.isReload});
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  ReviewController reviewController = Get.put(ReviewController());
  bool isMore = false;
  @override
  void initState() {
    super.initState();
    if (this.widget.isReload) {
      Future.delayed(Duration.zero, () async {
        await reviewController.fetchAllreview(productId: this.widget.productId);
      });
    }
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
          'Đánh giá sản phẩm',
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
        width: MediaQuery.of(context).size.width,
        //  alignment: Alignment.topRight,
        child: Obx(() {
          if (reviewController.isLoading.value) {
            return Center(
                child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.redAccent)));
          } else
            return Column(
              children: [
                FadeInAnimation(
                  delay: 2,
                  child: Container(
                    color: Colors.grey[200],
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 16.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "${reviewController.rating.toStringAsFixed(1)}",
                                      style: GoogleFonts.spartan(
                                        textStyle: TextStyle(
                                          fontSize: 48,
                                          color: Colors.redAccent,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -1,
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                      text: "/5",
                                      style: TextStyle(
                                        fontSize: 24.0,
                                        color: Color(0xFF808080),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 35),
                              child: Text(
                                  '${reviewController.reviewList.length} Đánh giá', style: GoogleFonts.spartan(
                                textStyle: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                  letterSpacing: -1,
                                ),
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child:        RatingBarIndicator(
                                rating:reviewController.rating.value,
                                itemBuilder:(context,index) => Icon(
                                  Icons.star,
                                  color: Colors.orange,

                                ),
                                itemCount: 5,
                                itemSize: 28.0,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              "${reviewController.countView}  Bình luận",
                              style: GoogleFonts.spartan(
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  letterSpacing: -1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 200.0,
                          child: ListView.builder(
                            shrinkWrap: true,
                            reverse: true,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Text(
                                    "${index + 1}",
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  SizedBox(width: 4.0),
                                  Icon(Icons.star, color: Colors.orange),
                                  SizedBox(width: 8.0),
                                  LinearPercentIndicator(
                                    lineHeight: 6.0,
                                    // linearStrokeCap: LinearStrokeCap.roundAll,
                                    width:
                                        MediaQuery.of(context).size.width / 2.8,
                                    animation: true,
                                    animationDuration: 2500,
                                    percent: reviewController.ratingList[index],
                                    progressColor: Colors.orange,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SideInAnimation(
                    delay: 3,
                    child: Obx(() {
                      if (reviewController.reviewList.length == 0)
                        return Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height:  MediaQuery.of(context).size.height / 4,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 80,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('assets/comment.png'))),
                              ),
                              Text(
                                'Chưa có bình luận',
                                style: GoogleFonts.spartan(
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      else
                        return ListView.separated(
                          padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
                          itemCount: reviewController.reviewList.length,
                          itemBuilder: (context, index) {
                            var data = reviewController.reviewList[index];
                            return ReviewUI(
                              image: data.userimage == null
                                  ? ''
                                  : data.userimage!,
                              name: data.username!,
                              date: data.dayComment!,
                              comment: data.comment == ''
                                  ? 'Không bình luận'
                                  : data.comment!,
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
                        );
                    }),
                  ),
                ),
              ],
            );
        }),
      ),
    );
  }


}
