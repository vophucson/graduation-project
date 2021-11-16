import 'package:appshop1/Controller/bannerController.dart';
import 'package:appshop1/Widget/side_in_animation.dart';
import 'package:appshop1/Widget/widget_home_categories.dart';
import 'package:appshop1/Widget/widget_home_product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashboardPages();
  }
}

class DashboardPages extends State<DashboardPage> {
  final homeBanner = Get.put(BannerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            imageCarousel(context),
            WidgetCategories(),
            WidgetAllProduct(),
            //    WidgetAllProduct(),
          ],
        ),
      ),
    );
  }

  Widget imageCarousel(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: Obx(() {
        if (homeBanner.isLoading.value) {
          return Center(
              child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent)));
        } else
          return SideInAnimation(
            delay: 2,
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                      height: 250, autoPlay: true,autoPlayInterval: Duration(seconds: 2),
                  enlargeCenterPage: true,enlargeStrategy: CenterPageEnlargeStrategy.scale),
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    final urlImage = homeBanner.bannerList[index].bannerImage;
                    return buildImage(urlImage!, index);
                  },
                  itemCount: homeBanner.bannerList.length,
                )),
          );
      }),
    );
  }

  Widget buildImage(String urlImage, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      color: Colors.grey,
      child: Image.network(
        urlImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
