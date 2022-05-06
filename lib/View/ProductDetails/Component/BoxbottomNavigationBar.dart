import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fruity/Model/model_cart.dart';
import 'package:fruity/Model/model_product.dart';

import '/Controller/Controller_Cart.dart';
import '/Controller/Controller_Product.dart';
import '/Helper/Constants.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import '/Helper/colorApp.dart';
import 'EditQuantityProduct.dart';

class BoxBottomNavigationBar extends StatelessWidget {
  ControllerProduct controller = Get.find();
  ControllerCart controllerCart = Get.find();
  final ProductData productData;

  BoxBottomNavigationBar({Key key, this.productData}) : super(key: key);
  isQuantity() => controller.quantityProduct == "0";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerProduct>(
      builder: (logic) {
        final bool isAdded = logic.controllerCart.cartList
            .map((element) => element.productId)
            .contains(logic.dateProduct.id);

        return Obx(() => logic.controllerCart.cartList
                .map((element) => element.productId)
                .contains(logic.dateProduct.id)
            ? EditQuantityProduct()
            : Container(
                width: An.widthQuery(),
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                // اذ كانت قيمة كمية المنتج صفر سوف يتم تعطيل زر اضافة للسلة
                child: An.buttonElevated(
                  radius: 10,
                  fontSize: fontSizeTitle,
                  name: isQuantity() ? "SorryProductSoldOut".tr : "addCart".tr,
                  onPressed: isQuantity()
                      ? null
                      : () {
                          // اذا كان لايوجد خصائص للمنتج نفذ Methode addFeaturesIsEmpty
                          controller.dateProduct.features.isEmpty
                              ? controller.addFeaturesIsEmpty()
                              // وذا وجد خصائص للمنتج ولكن لا يتم تحديد اي خاصية منهم نفد  unSelected
                              : controller.selectedItem == null
                                  ? controller.unSelected()
                                  // addByFeatures وفي حالة تم تحديد الخاصية نفذ
                                  : controller.addByFeatures();
                          logic.update();
                        },
                  fontFamily: "$fontFamily",
                  colorPrimary: ColorApp.primary(context),
                )));
      },
    );
  }
}
