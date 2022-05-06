import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Controller/Controller_Product.dart';
import '/Helper/Constants.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import '/Helper/colorApp.dart';
import '/View/Home/Component/BoxPriceProduct.dart';
import 'Component/BoxHeader.dart';
import 'Component/BoxNameCompany.dart';
import 'Component/BoxNameProductAndShare.dart';
import 'Component/BoxProductFeatures.dart';
import 'Component/BoxbottomNavigationBar.dart';

class ScreenProductDetails extends GetView<ControllerProduct> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorApp.scaffold(context),

        //======body==========================================================
        body: FutureBuilder(
          future: controller.futureApiProduct,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  // ==== Slider Image & Button ============================

                  Expanded(
                    child: new Container(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          BoxHeader(),
                          SizedBox(height: 30),
                          new Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // name product and Button Share and Favorite ======
                                BoxNameAndShare(),

                                // ==== Box Price ==================================
                                GetBuilder<ControllerProduct>(
                                  builder: (logic) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 10),
                                          child: BoxPriceProduct(
                                            priceMain:
                                                "${controller.afterExtraPrice.toStringAsFixed(3)}",
                                            sizeMain: 29,
                                            priceDiscount: controller
                                                        .dateProduct
                                                        .mainprice ==
                                                    controller
                                                        .dateProduct.discount
                                                ? null
                                                : "${controller.dateProduct.mainprice}",
                                            sizeDiscount: 19,
                                          ),
                                        ),
                                        controller.quantityProduct == "0"
                                            ? An.text("SorryProductSoldOut".tr,
                                                color: Colors.red)
                                            : Row(
                                                children: [
                                                  An.text(
                                                      "${controller.quantityProduct}",
                                                      size: fontSizeTitle),
                                                  const SizedBox(width: 5),
                                                  An.text("Quantity".tr,
                                                      size: fontSizeTitle,
                                                      color: ColorApp.subTitle(
                                                          context)),
                                                ],
                                              )
                                      ],
                                    );
                                  },
                                ),

                                // name company and name Categories ==================
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: new Row(
                                    children: [
                                      BoxNameCompany(
                                          name: controller
                                              .dateProduct.categoryName),
                                      SizedBox(width: 10),
                                      // BoxNameCompany(),
                                    ],
                                  ),
                                ),

                                //= Box Product Features =======================================
                                ConditionalBuilder(
                                  condition: controller
                                      .dateProduct.features.isNotEmpty,
                                  builder: (context) => BoxProductFeatures(),
                                  fallback: (context) => SizedBox(),
                                ),

                                new Divider(
                                    height: 50,
                                    color: Colors.blueGrey[100],
                                    thickness: 2),

                                //= Product Description =======================================
                                An.text("ProductDetails".tr,
                                    size: fontSizeTitle),
                                SizedBox(height: 10),
                                An.text("${controller.dateProduct.descrption}",
                                    size: fontSizeSubTitle,
                                    color: Colors.blueGrey),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  Container(
                    padding: GetPlatform.isIOS
                        ? const EdgeInsets.only(bottom: 30)
                        : const EdgeInsets.only(bottom: 15),
                    height: GetPlatform.isIOS ? 100 : 80,
                    child: BoxBottomNavigationBar(
                        productData: controller.dateProduct),
                  ),
                ],
              );
            }
            return An.circular();
          },
        ),
      ),
    );
  }
}
