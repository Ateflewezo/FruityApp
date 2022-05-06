import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:fruity/Controller/Controller_HomeApp.dart';
import '/Controller/Controller_OrderDetails.dart';
import '/Helper/Constants.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import '/Helper/colorApp.dart';
import 'package:get/get.dart';

class BoxTotalPrice extends StatelessWidget {
  ControllerOrderDetails controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: HexColor("${Get.find<ControllerHomeApp>().info.color}")
            .withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          An.text("totalFatoorah".tr, size: fontSizeTitle),
          new Row(
            children: [
              An.text("${controller.info.total}",
                  size: fontSizeTitle + 5, fontWeight: FontWeight.bold),
              const SizedBox(width: 10),
              An.text("kd".tr, size: fontSizeSubTitle),
            ],
          )
        ],
      ),
    );
  }
}
