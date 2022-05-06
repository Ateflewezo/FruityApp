import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruity/Controller/Controller_Cart.dart';
import 'package:fruity/Helper/WidgetShareApp/Navigator.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/colorApp.dart';
import 'package:get/get.dart';

Widget appBarCart(BuildContext context) {
  return AppBar(
    elevation: 0,
    title: GetX<ControllerCart>(
      init: ControllerCart(),
      initState: (_) {},
      builder: (logic) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            An.text("shoppingCart".tr, color: Colors.black),
            Container(
              width: 80,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset("assets/images/shopping-cart.svg",
                      width: 40, height: 40),
                  Positioned(
                      left: 50,
                      top: 5,
                      child: CircleAvatar(
                          backgroundColor: Colors.black,
                          maxRadius: 13,
                          child: An.text(logic.cartList.length.toString(),
                              color: Colors.white,
                              fontWeight: FontWeight.bold)))
                ],
              ),
            ),
          ],
        );
      },
    ),
    backgroundColor: ColorApp.scaffold(context),
    leading: SizedBox(),
    actions: [
      Go.canPop() == false
          ? SizedBox()
          : IconButton(
              onPressed: () => Go.pop(),
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorApp.blackColor(context),
              )),
    ],
  );
}
