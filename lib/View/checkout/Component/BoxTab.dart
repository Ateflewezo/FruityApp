import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Helper/Constants.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import '/Helper/colorApp.dart';
import '/Controller/Controller_checkout.dart';

class TabTypeAddress extends StatelessWidget {
  ControllerCheckout controller = Get.find();

  double width = An.widthQuery() / 3 - 22;
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: controller.namesShippingWay.length,
        itemBuilder: (context, index) {
          return GetBuilder<ControllerCheckout>(
            builder: (logic) {
              return GestureDetector(
                onTap: () => controller.changeTab(index),
                child: controller.isIndex == index
                    ? active(index, context)
                    : unActive(index, context),
              );
            },
          );
        },
      ),
    );
  }

  Widget active(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 30,
      width: width,
      decoration: BoxDecoration(
          color: ColorApp.primary(context),
          border: Border.all(width: 1, color: ColorApp.primary(context)),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          An.text(controller.namesShippingWay[index],
              color: Colors.white,
              fontWeight: FontWeight.bold,
              size: fontSizeSubTitle),
        ],
      ),
    );
  }

  Widget unActive(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 30,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: ColorApp.subTitle(context)),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          An.text(controller.namesShippingWay[index], size: fontSizeSubTitle),
        ],
      ),
    );
  }
}
