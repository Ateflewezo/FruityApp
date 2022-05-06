import 'package:flutter/material.dart';
import 'package:fruity/Controller/Controller_search.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/colorApp.dart';
import 'package:fruity/Helper/routes/routes.dart';
import 'package:fruity/Model/ModelSearch.dart';
import 'package:fruity/View/Home/Component/BoxPriceProduct.dart';
import 'package:get/get.dart';

Widget boxItemSearch(
    BuildContext context, int index, SearchController controller) {
  DatumSearch itemSearch = controller.searchResults[index];
  return GestureDetector(
    onTap: () =>
        Get.toNamed(AppRoutes.productDetails, arguments: itemSearch.id),
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 100,
      decoration: BoxDecoration(
          border: Border.all(color: ColorApp.searchBox(context), width: 0.5),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          new Expanded(
              flex: 2,
              child: InkWell(
                onTap: () => An.viewImage(image: "${itemSearch.imagePath}"),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: An.cachedNetworkImage("${itemSearch.imagePath}"),
                ),
              )),
          new Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Flexible(
                        child: An.text("${itemSearch.name}",
                            size: fontSizePrice + 3,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis)),
                    SizedBox(height: 10),
                    BoxPriceProduct(
                      priceMain: itemSearch.discount,
                      priceDiscount: itemSearch.mainprice,
                      sizeMain: 23,
                      sizeDiscount: 18,
                    )
                  ],
                ),
              ))
        ],
      ),
    ),
  );
}
