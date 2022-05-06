import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fruity/Controller/Controller_Favorite.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/routes/routes.dart';
import 'package:fruity/Model/model_category.dart';
import '/Helper/WidgetShareApp/Navigator.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import '/Helper/colorApp.dart';
import 'BoxFavorite.dart';

class ScreenFavorite extends GetView<ControllerFavorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //====AppBar =============================================
      appBar: AppBar(
        elevation: 0,
        title: An.text("المفضلة", color: Colors.black),
        centerTitle: true,
        backgroundColor: ColorApp.scaffold(context),
        actions: [
          Go.canPop() == false
              ? SizedBox()
              : IconButton(
                  onPressed: () => Go.pop(),
                  icon: Icon(Icons.arrow_forward_ios,
                      color: ColorApp.blackColor(context)))
        ],
      ),

      body: Obx(() {
        return controller.favoritesList.isEmpty
            ? buildCenter()
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 8,
                ),
                itemCount: controller.favoritesList.length,
                itemBuilder: (context, index) {
                  DatumProduct item = controller.favoritesList[index];
                  return BoxFavorite(
                    product: item,
                    onTap: () => Get.toNamed(AppRoutes.productDetails,
                        arguments: item.id),
                  );
                });
      }),
    );
  }

  Widget buildCenter() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/heart.gif", width: 75, height: 75),
            const SizedBox(height: 20),
            An.text("اضف منتجاتك المفضلة هنا", size: fontSizeTitle),
          ],
        ),
      );
}
