import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Api/Api_Cart.dart';
import '/Controller/Controller_Cart.dart';
import '/Helper/WidgetShareApp/Navigator.dart';
import '/Helper/routes/routes.dart';
import '/Model/model_cart.dart';
import 'package:platform_device_id/platform_device_id.dart';
import '/Helper/Constants.dart';
import '/Helper/WidgetShareApp/ButtonFavourite.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import '/Helper/colorApp.dart';
import '/Model/model_category.dart';
import '/View/Home/Component/BoxPriceProduct.dart';

class ProductOne extends StatelessWidget {
  final Function onTap, onTapFav;
  final DatumProduct product, isFav;

  const ProductOne(
      {Key key, this.onTap, this.onTapFav, this.product, this.isFav})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.blueGrey[200], width: 0.3),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    //====== image Product =====================================
                    new Container(
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: An.cachedNetworkImage("${product.imagePath}"),
                        )),

                    //====== Discount ========================================
                    Positioned(
                      top: 10,
                      left: 10,
                      child: product.prefitPriceDiscount == "0"
                          ? SizedBox()
                          : Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        child: Center(
                            child: An.text(
                                "% ${product.prefitPriceDiscount}",
                                size: fontSizeTitle - 3,
                                fontWeight: FontWeight.bold,
                                color: ColorApp.whiteColor(context))),
                        decoration: BoxDecoration(
                            color: ColorApp.off(context),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ],
                ),
              ),
              new Container(
                height: 130,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //====== Name Product ======================================
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: An.text("${product.name}",
                          size: fontSizeSubTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.blueGrey),
                    ),

                    //====== Price =============================================
                    BoxPriceProduct(
                        priceMain: "${product.discount}",
                        sizeMain: fontSizePrice + 5,
                        priceDiscount: product.discount == product.mainprice
                            ? null
                            : "${product.mainprice}",
                        sizeDiscount: fontSizePrice),

                    //====== addCart and Button Favourite  =====================
                    Expanded(
                      child: new Container(
                        margin: const EdgeInsets.only(top: 1, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonFavourite(product: product),
                            GetBuilder<ControllerCart>(builder: (logic) {
                              ProductsCart item;
                              if (logic.cartList.isNotEmpty &&
                                  logic.cartList.map((element) => element.productId).toList().contains(product.id))
                                item = logic.cartList.firstWhere((element) =>
                                element.productId == product.id);
                              return Obx(() => logic.cartList.map((element) => element.productId).contains(product.id)
                                  ? Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorApp.primaryWithOpacity(context),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              if (item != null) logic.editItemCartPlus(item);
                                            },
                                            child: new CircleAvatar(
                                                child: Icon(Icons.add, size: 22,color:Colors.white),
                                                backgroundColor:ColorApp.primary(context),
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
                                              if (item != null) logic.editItemCartMinus(item);
                                            },
                                            child: new CircleAvatar(
                                                child: Icon(Icons.remove, size: 22,color: Colors.white),
                                                backgroundColor:Colors.black, maxRadius: 16)),
                                      ],
                                    ),
                                  )
                                  : An.buttonElevated(
                                  name: "addCart".tr,
                                  onPressed: (product.featureExist)
                                      ? () => Get.toNamed(AppRoutes.productDetails, arguments: product.id)
                                      : product.stock == 0 ? () {
                                    AwesomeDialog(
                                      dismissOnTouchOutside:
                                      false,
                                      context: Get.context,
                                      animType: AnimType.SCALE,
                                      dialogType: DialogType.INFO,
                                      title:
                                      'SorryProductSoldOut'.tr,
                                    )..show();
                                    Future.delayed(new Duration(seconds: 3), () => Go.pop());
                                  }
                                      : () async {
                                    String deviceId = await PlatformDeviceId.getDeviceId;
                                    Map<String, dynamic> bodyDat =
                                    {
                                      "mac_address": "$deviceId",
                                      "product_id":
                                      product.id.toString(),
                                      "quantity": "1",
                                      "price": product.discount
                                          .toString(),
                                    };
                                    await ApiCart.addProductToCart(bodyDat);
                                    await logic.fetchApiGetCart();
                                    logic.update();
                                  },
                                  width: 130,
                                  height: 45,
                                  radius: 10,
                                  fontFamily: fontFamily,
                                  fontSize: fontSizePrice,
                                  colorPrimary: ColorApp.primary(context)
                              ));
                            }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
