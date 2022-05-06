import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:fruity/Controller/Controller_HomeApp.dart';
import '/Model/ModelOrderDetails.dart';
import '/Helper/Constants.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import '/Helper/colorApp.dart';
import 'package:get/get.dart';

class BoxProduct extends StatelessWidget {
  final ProductOrder item;
  const BoxProduct({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double price = double.parse(item.price);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: ColorApp.whiteColor(context),
        border: Border.all(width: 0.5, color: Colors.blueGrey[300]),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 130,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => An.viewImage(image: "${item.imagePath}"),
              child: new Container(
                height: 150,
                width: 120,
                child: An.cachedNetworkImage("${item.imagePath}"),
              ),
            ),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                An.text("${item.name}",
                    size: fontSizeSubTitle, color: ColorApp.subTitle(context)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    An.text("${price.toStringAsFixed(3)}",
                        color: ColorApp.primary(context),
                        size: fontSizeTitle + 5,
                        fontWeight: FontWeight.bold),
                    const SizedBox(width: 5),
                    An.text("kd".tr, size: fontSizeSubTitle),
                  ],
                ),
                new Row(
                  children: [
                    item.feature.isEmpty
                        ? SizedBox()
                        : Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            margin: const EdgeInsets.only(
                                top: 10, bottom: 5, left: 20),
                            decoration: BoxDecoration(
                              color: HexColor(
                                      Get.find<ControllerHomeApp>().info.color)
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: An.text("${item.feature}",
                                size: fontSizeSubTitle + 3,
                                color: ColorApp.blackColor(context)),
                          ),
                    new Row(
                      children: [
                        An.text("Quantity".tr),
                        An.text("${item.quantity}", size: fontSizeTitle),
                      ],
                    )
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
