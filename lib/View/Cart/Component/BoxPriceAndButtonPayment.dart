import 'package:flutter/material.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/colorApp.dart';
import 'package:get/get.dart';

class BoxPriceAndButtonPayment extends StatelessWidget {
  final VoidCallback onTap;
  final String totlePrice;
  const BoxPriceAndButtonPayment({Key key, this.onTap, this.totlePrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Column(
        children: [
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              An.text("Total".tr, size: fontSizeTitle),
              Row(
                children: [
                  An.text("$totlePrice",
                      size: fontSizeTitle + 5, fontWeight: FontWeight.bold),
                  An.text("kd".tr,
                      size: fontSizeTitle, color: ColorApp.subTitle(context)),
                ],
              )
            ],
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: An.widthQuery(),
            child: An.buttonElevated(
                colorPrimary: ColorApp.primary(context),
                name: "payNow".tr,
                height: 55,
                fontFamily: "$fontFamily",
                radius: 10,
                fontSize: fontSizeTitle,
                onPressed: onTap),
          )
        ],
      ),
    );
  }
}
