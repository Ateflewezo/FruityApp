import 'package:flutter/material.dart';
import '/Controller/Controller_Favorite.dart';
import '/Model/model_category.dart';
import 'package:get/get.dart';

class ButtonFavourite extends StatelessWidget {
  final DatumProduct product;
  const ButtonFavourite({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControllerFavorites cFavorites = Get.find();
    return Obx(() {
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
            color: Colors.amber,size: 28,),
      );
    });
  }
}
