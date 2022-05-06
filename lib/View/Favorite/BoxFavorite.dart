import 'package:flutter/material.dart';
import 'package:fruity/Controller/Controller_Favorite.dart';
import '/Helper/Constants.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import '/Helper/colorApp.dart';
import '/Model/model_category.dart';
import '/View/Home/Component/BoxPriceProduct.dart';
import 'package:get/get.dart';

class BoxFavorite extends StatelessWidget {
  final Function onTap, onTapFav;
  final DatumProduct product, isFav;

  const BoxFavorite(
      {Key key, this.onTap, this.onTapFav, this.product, this.isFav})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControllerFavorites cFavorites = Get.find();
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
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
                    new Container(
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: An.cachedNetworkImage("${product.imagePath}"),
                        )),

                    //====== Discount ========================================
                  ],
                ),
              ),
              new Container(
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //====== Name Product ========================================
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: An.text("${product.name}",
                          size: fontSizeSubTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.blueGrey),
                    ),

                    //====== Price ===============================================
                    BoxPriceProduct(
                        priceMain: "${product.discount}",
                        sizeMain: fontSizePrice + 5,
                        priceDiscount: product.discount == product.mainprice
                            ? null
                            : "${product.mainprice}",
                        sizeDiscount: fontSizePrice),

                    Expanded(
                      child: new Container(
                        margin: const EdgeInsets.only(top: 1, bottom: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            product.prefitPriceDiscount == "0"
                                ? SizedBox()
                                : new Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 2),
                                    child: Center(
                                        child: An.text(
                                            "% ${product.prefitPriceDiscount}",
                                            size: fontSizeTitle - 3,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                ColorApp.whiteColor(context))),
                                    decoration: BoxDecoration(
                                        color: ColorApp.off(context),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                            IconButton(
                                onPressed: () =>
                                    cFavorites.removeFavorite(product: product),
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.amber,
                                ))
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
