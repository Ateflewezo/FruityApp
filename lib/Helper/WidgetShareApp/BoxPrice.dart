import 'package:flutter/material.dart';
import 'package:fruity/Helper/colorApp.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:get/get.dart';

class BoxPrice extends StatelessWidget {
  final String priceMain, priceDiscount;
  final double sizeMain;
  final double sizeDiscount;

  const BoxPrice(
      {Key key,
      this.priceMain,
      this.priceDiscount,
      this.sizeMain,
      this.sizeDiscount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            An.text("$priceMain",
                fontWeight: FontWeight.bold,
                size: sizeMain,
                color: ColorApp.primary(context)),
            SizedBox(width: 3),
            An.text("kd".tr, size: sizeMain - 9),
          ],
        ),
        SizedBox(width: 10),
        Row(
          children: [
            An.text(
              "$priceDiscount",
              size: sizeDiscount,
              decoration: TextDecoration.lineThrough,
              color: Colors.blueGrey,
            ),
            SizedBox(width: 3),
            An.text(
              "kd".tr,
              size: sizeDiscount - 5,
              decoration: TextDecoration.lineThrough,
              color: Colors.blueGrey,
            ),
          ],
        ),
      ],
    );
  }
}
