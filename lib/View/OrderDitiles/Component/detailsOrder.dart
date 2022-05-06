import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:fruity/Controller/Controller_HomeApp.dart';
import '/Controller/Controller_OrderDetails.dart';
import '/Helper/Constants.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import '/Helper/colorApp.dart';
import 'package:get/get.dart';

class DetailsOrder extends StatelessWidget {
  ControllerOrderDetails controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: An.widthQuery(),
      decoration: BoxDecoration(
          color: ColorApp.whiteColor(context),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            An.shadow(
                color: HexColor("${Get.find<ControllerHomeApp>().info.color}")
                    .withOpacity(0.1))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          An.text("OrderInformation".tr,
              size: fontSizeTitle, color: ColorApp.primary(context)),
          const SizedBox(height: 15),
          namValueText(
              name: "DeliveryDate".tr,
              value: "${controller.deliveryInfo.orderArrivalDate}"),
          const SizedBox(height: 15),
          namValueText(
              name: "DeliveryTime".tr,
              value:
                  "${controller.deliveryInfo.orderArrivalTimeFrom} ${controller.deliveryInfo.orderArrivalTimeTo}"),
          const SizedBox(height: 8),
          const SizedBox(height: 8),
          namValueText(
              name: "DeliveryAddress".tr,
              value: "${controller.deliveryInfo.address}"),
        ],
      ),
    );
  }
}

Row namValueText({String name, value, BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      An.text("$name :",
          size: fontSizePrice + 3, color: ColorApp.subTitle(context)),
      const SizedBox(width: 10),
      Flexible(child: An.text("$value", size: fontSizePrice + 3))
    ],
  );
}
