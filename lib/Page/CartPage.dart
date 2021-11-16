import 'package:appshop1/BouncyPageRoute.dart';
import 'package:appshop1/Controller/CartController.dart';
import 'package:appshop1/Page/checkOutPage.dart';
import 'package:appshop1/Widget/fade_in_animation.dart';
import 'package:appshop1/Widget/lock_screen.dart';
import 'package:appshop1/Widget/side_in_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appshop1/Model/Cart_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';

class CartPages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CartPages();
  }
}

class _CartPages extends State<CartPages> {
 final CartController cartController = Get.put(CartController());
  @override
  void initState() {
    super.initState();
    cartController.fetchAllCart();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white30,
        body: _buildOrderDetail(context),
        bottomNavigationBar: cartController.success.value == 0
            ? null
            : FadeInAnimation(delay: 2, child: CheckOutCard()),
      ),
    );
  }

  Widget _buildOrderDetail(BuildContext context) {
    return Obx(() {
      if (cartController.isLoading.value)
        return Padding(
          padding: const EdgeInsets.fromLTRB(100, 250, 100, 100),
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
            ),
          ),
        );
      else if (cartController.success.value == 0)
        return FadeInAnimation(delay: 1, child: LockScreen());
      else {
        return SideInAnimation(
          delay: 1,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: ListView.builder(
              itemCount: cartController.cartList.length,
              itemBuilder: (context, index)  {
                var data = cartController.cartList;
              //  cartController.totalX(cartController.totalX.value + data[index].productPrice!);
                return
                  Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(data[index].orderId.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    cartController
                        .deleteOrder(data[index].orderId.toString());
                    data.removeAt(index);
                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        Icon(
                          Icons.delete_forever,
                          size: 40,
                          color: Colors.redAccent,
                        )
                      ],
                    ),
                  ),
                  child: CartCard(cart: cartController.cartList[index]),
                ),
              );
            }
            ),
          ),
        );
      }
    });
  }
}

class CartCard extends StatelessWidget {
  const CartCard({
    required this.cart,
  });

  final Data cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(
                cart.imageUrl!,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.productName!,
              style: GoogleFonts.spartan(
                textStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -1,
                ),
              ),
              maxLines: 2,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              cart.productSize.toString(),
              style: GoogleFonts.spartan(
                textStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -1,
                ),
              ),
              maxLines: 2,
            ),
            SizedBox(height: 5),
            Text.rich(
              TextSpan(
                text: "${cart.productPrice.toVND(unit: 'VNĐ')}",
                style: GoogleFonts.spartan(
                  textStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                  ),
                ),
                children: [
                  TextSpan(
                      text: " x${cart.quantity}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
            SizedBox(height: 5),
            Text.rich(
              TextSpan(
                text: "Thành tiền: ",
                style: GoogleFonts.spartan(
                  textStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                  ),
                ),
                children: [
                  TextSpan(
                    text: " ${cart.totalPrice.toVND(unit: 'VNĐ')}",
                    style: GoogleFonts.spartan(
                      textStyle: TextStyle(
                        fontSize: 13,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class CheckOutCard extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Container(
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
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 200,
                    child: Obx(
                      () => Text.rich(
                        TextSpan(
                          text: "Tổng Tiền:\n",
                          style: GoogleFonts.spartan(
                            textStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -1,
                            ),
                          ),
                          children: [
                            TextSpan(
                              text:
                                  "${cartController.totalX.toVND(unit: 'VNĐ')}",
                              style: GoogleFonts.spartan(
                                textStyle: TextStyle(
                                  fontSize: 15,
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Colors.redAccent,
                      onPressed: () {
                        print(cartController.cartList.length);
                        Navigator.push(context,
                            BouncyPageRoute(widget: CheckOutPage(count: cartController.cartList.length,price: cartController.totalX.value,)));
                      },
                      child: Text(
                        "Thanh Toán",
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
    );
  }
}
