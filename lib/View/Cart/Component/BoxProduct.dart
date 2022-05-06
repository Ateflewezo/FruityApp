import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:fruity/Controller/Controller_HomeApp.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/colorApp.dart';
import 'package:fruity/Model/model_cart.dart';
import 'package:get/get.dart';

class BoxProduct extends StatelessWidget {
  final GestureTapCallback onTapAddQuantity, onTapReduceQuantity, onTapDelete;
  final ProductsCart productsCart;

  const BoxProduct(
      {Key key,
      this.onTapAddQuantity,
      this.onTapReduceQuantity,
      this.onTapDelete,
      this.productsCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: ColorApp.subTitle(context), width: 0.3),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: 120,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "${productsCart.imagePath}",
                  fit: BoxFit.fill,
                ),
              )),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  An.text("${productsCart.name}",
                      size: fontSizePrice, color: ColorApp.blackColor(context)),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      An.text("${productsCart.price}",
                          fontWeight: FontWeight.bold,
                          size: fontSizeTitle + 3,
                          color: ColorApp.primary(context)),
                      SizedBox(width: 3),
                      An.text("kd".tr,
                          size: fontSizeSubTitle,
                          color: ColorApp.subTitle(context)),
                    ],
                  ),
                  productsCart.feature.isEmpty
                      ? SizedBox()
                      : Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          margin: const EdgeInsets.only(top: 10, bottom: 5),
                          decoration: BoxDecoration(
                            color: HexColor(
                                    Get.find<ControllerHomeApp>().info.color)
                                .withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: An.text("${productsCart.feature}",
                              size: fontSizeSubTitle + 3,
                              color: ColorApp.blackColor(context)),
                        ),
                  const SizedBox(height: 8),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new Row(
                        children: [
                          InkWell(
                              onTap: onTapAddQuantity,
                              child: new CircleAvatar(
                                  child: Icon(
                                    Icons.add,
                                    size: 25,
                                  ),
                                  backgroundColor: Colors.blueGrey[50],
                                  maxRadius: 18)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: An.text(
                              "${productsCart.quantity}",
                              size: 25,
                            ),
                          ),
                          InkWell(
                              onTap: onTapReduceQuantity,
                              child: new CircleAvatar(
                                  child: Icon(
                                    Icons.remove,
                                    size: 25,
                                  ),
                                  backgroundColor: Colors.blueGrey[50],
                                  maxRadius: 18)),
                        ],
                      ),
                      InkWell(
                        onTap: onTapDelete,
                        child: new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.delete_forever,
                                color: Colors.red, size: 30),
                            An.text("delete".tr,
                                size: fontSizeSubTitle, color: Colors.red),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
