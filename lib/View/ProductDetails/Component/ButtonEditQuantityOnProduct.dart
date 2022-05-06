import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:fruity/Controller/Controller_Cart.dart';
import 'package:fruity/Controller/Controller_HomeApp.dart';
import 'package:fruity/Controller/Controller_Product.dart';
import 'package:get/get.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/colorApp.dart';

class ButtonEditQuantityOnProduct extends StatelessWidget {
  ControllerProduct controller = Get.find();
  ControllerCart controllerCart = Get.find();
  ControllerHomeApp controllerHome = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 3, bottom: 3, left: 20, right: 20),
      decoration: BoxDecoration(
          color: HexColor("${controllerHome.info.color}").withOpacity(0.3),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          An.text("الكمية", size: fontSizeTitle),
          const SizedBox(width: 30),
          new Row(
            children: [
              InkWell(
                  onTap: () => controllerCart.addQuantity(controller.isPro.id),
                  child: new CircleAvatar(
                    child: Icon(Icons.add, color: Colors.white),
                    maxRadius: 18,
                    backgroundColor: ColorApp.primary(context),
                  )),
              Padding(
                child: An.text("${controller.isPro.quantity}",
                    size: fontSizeTitle + 5, fontWeight: FontWeight.bold),
                padding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              InkWell(
                  onTap: () {},
                  child: new CircleAvatar(
                    child: Icon(Icons.remove, color: Colors.white),
                    maxRadius: 18,
                    backgroundColor: Colors.red,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
