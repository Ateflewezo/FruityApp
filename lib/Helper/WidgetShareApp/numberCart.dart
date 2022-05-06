import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruity/Controller/Controller_Cart.dart';

import 'WidgetShareApp.dart';

Widget numberCart(ControllerCart logic) {
  return Stack(
    alignment: Alignment.center,
    children: [
      SvgPicture.asset("assets/images/shopping-cart.svg",
          width: 40, height: 40),
      Positioned(
          left: 30,
          top: 5,
          child: CircleAvatar(
              backgroundColor: Colors.black,
              maxRadius: 13,
              child: An.text(logic.cartList.length.toString(),
                  color: Colors.white, fontWeight: FontWeight.bold)))
    ],
  );
}
