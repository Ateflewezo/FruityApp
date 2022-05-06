import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruity/Controller/Controller_Favorite.dart';
import '/Controller/Controller_Product.dart';
import '/Helper/Constants.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:get/get.dart';
import '/Model/model_category.dart';
import '/Model/model_product.dart';

class BoxNameAndShare extends StatelessWidget {
  ControllerProduct controller = Get.find();
  ControllerFavorites cFavorites = Get.find();

  @override
  Widget build(BuildContext context) {
    ProductData dateProduct = controller.dateProduct;
    DatumProduct product = new DatumProduct(
        id: dateProduct.id,
        image: dateProduct.image,
        isFavourite: false,
        name: dateProduct.name,
        discount: dateProduct.discount,
        mainprice: dateProduct.mainprice,
        prefitPriceDiscount: dateProduct.prefitPriceDiscount);
    // print(dateProduct);

    return GetBuilder<ControllerProduct>(
      builder: (logic) {
        return Container(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Flexible(
                  child: An.text("${controller.dateProduct.name}",
                      size: fontSizeTitle)),
              SizedBox(width: 30),
              Row(
                children: [
                  Obx(() {
                    return IconButton(
                      onPressed: () {
                        cFavorites.isFavourite(product.id)
                            ? cFavorites.removeFavorite(product: product)
                            : cFavorites.addFavorite(product: product);
                      },
                      icon: Icon(
                          cFavorites.isFavourite(product.id)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.amber,
                          size: 35),
                    );
                  }),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(CupertinoIcons.share, size: 30)),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
