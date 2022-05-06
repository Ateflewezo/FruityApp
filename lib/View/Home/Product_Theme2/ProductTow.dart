import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fruity/Api/Api_Cart.dart';
import 'package:fruity/Controller/Controller_Cart.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/ButtonFavourite.dart';
import 'package:fruity/Helper/WidgetShareApp/Navigator.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/colorApp.dart';
import 'package:fruity/Helper/routes/routes.dart';
import 'package:fruity/Model/model_cart.dart';
import 'package:fruity/Model/model_category.dart';
import 'package:fruity/View/Home/Component/BoxPriceProduct.dart';
import 'package:get/get.dart';
import 'package:platform_device_id/platform_device_id.dart';

class ProductTow extends StatelessWidget {
  final Function onTap, onTapFav;
  final DatumProduct product;
  const ProductTow({Key key, this.onTap, this.onTapFav, this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey[100]),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.only(top: 0),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: new Container(
                width: 120,
                height: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey[50]),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Center(
                        child: An.cachedNetworkImage("${product.imagePath}"))),
              ),
            ),
            Expanded(
              child: new Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                              child: An.text("${product.name}",
                                  size: fontSizeTitle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  color: ColorApp.blackColor(context))),
                          SizedBox(height: 5),
                          BoxPriceProduct(
                              priceMain: "${product.discount}",
                              priceDiscount:
                                  product.discount == product.mainprice
                                      ? null
                                      : "${product.mainprice}",
                              sizeMain: fontSizeTitle,
                              sizeDiscount: fontSizeSubTitle),
                          SizedBox(height: 5),

                          //add product to cart ====================
                          GetBuilder<ControllerCart>(builder: (logic) {
                            ProductsCart item;
                            if (logic.cartList.isNotEmpty &&
                                logic.cartList
                                    .map((element) => element.productId)
                                    .toList()
                                    .contains(product.id))
                              item = logic.cartList.firstWhere(
                                  (element) => element.productId == product.id);
                            return Obx(() => logic.cartList
                                    .map((element) => element.productId)
                                    .contains(product.id)
                                ? Container(
                                    width: 130,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 3),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          ColorApp.primaryWithOpacity(context),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              if (item != null)
                                                logic.editItemCartPlus(item);
                                            },
                                            child: new CircleAvatar(
                                                child: Icon(Icons.add,
                                                    size: 22,
                                                    color: Colors.white),
                                                backgroundColor:
                                                    ColorApp.primary(context),
                                                maxRadius: 16)),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: An.text(
                                            "${logic.cartList.firstWhere((element) => element.productId == product.id).quantity}",
                                            size: 25,
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              if (item != null)
                                                logic.editItemCartMinus(item);
                                            },
                                            child: new CircleAvatar(
                                                child: Icon(Icons.remove,
                                                    size: 22,
                                                    color: Colors.white),
                                                backgroundColor: Colors.black,
                                                maxRadius: 16)),
                                      ],
                                    ),
                                  )
                                : An.buttonElevated(
                                    name: "addCart".tr,
                                    onPressed: (product.featureExist)
                                        ? () => Get.toNamed(
                                            AppRoutes.productDetails,
                                            arguments: product.id)
                                        : product.stock == 0
                                            ? () {
                                                AwesomeDialog(
                                                  dismissOnTouchOutside: false,
                                                  context: Get.context,
                                                  animType: AnimType.SCALE,
                                                  dialogType: DialogType.INFO,
                                                  title:
                                                      'SorryProductSoldOut'.tr,
                                                )..show();
                                                Future.delayed(
                                                    new Duration(seconds: 2),
                                                    () => Go.pop());
                                              }
                                            : () async {
                                                String deviceId =
                                                    await PlatformDeviceId
                                                        .getDeviceId;
                                                Map<String, dynamic> bodyDat = {
                                                  "mac_address": "$deviceId",
                                                  "product_id":
                                                      product.id.toString(),
                                                  "quantity": "1",
                                                  "price": product.discount
                                                      .toString(),
                                                };
                                                await ApiCart.addProductToCart(
                                                    bodyDat);
                                                await logic.fetchApiGetCart();
                                                logic.update();
                                              },
                                    width: 130,
                                    height: 45,
                                    radius: 10,
                                    fontFamily: fontFamily,
                                    fontSize: fontSizePrice,
                                    colorPrimary: ColorApp.primary(context)));
                          }),
                        ],
                      ),
                    ),
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //====== Box Discount ====================================
                        product.prefitPriceDiscount == "0"
                            ? SizedBox()
                            : Container(
                                height: 50,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 3, vertical: 10),
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                    color: ColorApp.off(context),
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    )),
                                child: Center(
                                    child: Row(
                                  children: [
                                    An.text("%",
                                        size: fontSizeSubTitle + 3,
                                        fontWeight: FontWeight.bold,
                                        color: ColorApp.whiteColor(context)),
                                    const SizedBox(width: 2),
                                    An.text("${product.prefitPriceDiscount}",
                                        size: fontSizeSubTitle + 5,
                                        fontWeight: FontWeight.bold,
                                        color: ColorApp.whiteColor(context)),
                                  ],
                                )),
                              ),

                        Spacer(),

                        ButtonFavourite(product: product),
                        SizedBox(height: 30),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
