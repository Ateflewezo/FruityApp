import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:fruity/Controller/Controller_Cart.dart';
import 'package:fruity/Controller/Controller_HomeApp.dart';
import 'package:fruity/Controller/Controller_Product.dart';
import 'package:fruity/Helper/WidgetShareApp/Navigator.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:get/get.dart';
import 'package:fruity/Helper/WidgetShareApp/numberCart.dart';
import 'package:fruity/Helper/routes/routes.dart';

class BoxHeader extends StatelessWidget {
  ControllerProduct controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        new Container(
          width: 500,
          height: 500,
          decoration: BoxDecoration(
            // shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage("${controller.dateProduct.image}"),
                fit: BoxFit.fill),
          ),
        ),
        new Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Get.toNamed(AppRoutes.cart),
                child: new Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: HexColor(
                              "${Get.find<ControllerHomeApp>().info.color}")
                          .withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)),
                  child: GetX<ControllerCart>(
                    init: ControllerCart(),
                    initState: (_) {},
                    builder: (logic) {
                      return numberCart(logic);
                    },
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Go.pop();
                },
                child: new Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: HexColor(
                              "${Get.find<ControllerHomeApp>().info.color}")
                          .withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Icon(Icons.arrow_forward_ios_outlined, size: 25)),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
