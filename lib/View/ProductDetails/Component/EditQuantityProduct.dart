import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fruity/Controller/Controller_Product.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/colorApp.dart';
import 'package:fruity/Model/model_cart.dart';

class EditQuantityProduct extends StatelessWidget {
  EditQuantityProduct({
    Key key,
    this.id,
  }) : super(key: key);

  int id;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerProduct>(
      builder: (logic) {
        ProductsCart item;
        if (id == null) id = logic.dateProduct.id;
        if (logic.controllerCart.cartList.isNotEmpty &&
            logic.controllerCart.cartList
                .map((element) => element.productId)
                .toList()
                .contains(id))
          item = logic.controllerCart.cartList
              .firstWhere((element) => element.productId == id);
        return Obx(() {
          return Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorApp.primaryWithOpacity(context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    An.text("اضافة كمية", size: fontSizeTitle),
                    const SizedBox(width: 30),
                    InkWell(
                        onTap: () {
                          if (item != null)
                            logic.controllerCart.editItemCartPlus(item);
                        },
                        child: new CircleAvatar(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 25,
                            ),
                            backgroundColor: ColorApp.primary(context),
                            maxRadius: 18)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: An.text(
                          "${logic.controllerCart.cartList.firstWhere((element) => element.productId == id).quantity}",
                          size: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                        onTap: () {
                          if (item != null)
                            logic.controllerCart.editItemCartMinus(item);
                        },
                        child: new CircleAvatar(
                            child: Icon(
                              Icons.remove,
                              size: 25,
                              color: Colors.white,
                            ),
                            backgroundColor: Colors.black,
                            maxRadius: 18)),
                  ],
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
