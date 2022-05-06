import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:fruity/Controller/Controller_HomeApp.dart';
import '/Controller/Controller_OrderDetails.dart';
import '/Helper/Constants.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:get/get.dart';

class PaymentMethod extends StatelessWidget {
  ControllerOrderDetails controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
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
          An.text("Paymentmethod".tr, size: fontSizeTitle),
          new Row(
            children: [
              An.text("${controller.info.paymentMethod}",
                  size: fontSizeSubTitle, fontWeight: FontWeight.bold),
            ],
          )
        ],
      ),
    );
  }
}
